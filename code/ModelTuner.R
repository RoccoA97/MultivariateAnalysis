# the tune builder performs a cross validation grid search on a params list passed
#example of code to execute this is:
#Batch_Epoch_List <- list(batch_size=c( 10), 
#               epochs=c(5,10,20, 30, 50, 75, 100, 150, 200, 300))
#tuned_grid <- tune_builder(build_model, TunerParams, Batch_Epoch_List, 4, FALSE, "Models/Batch_Epoch/" )
#print(tuned_grid)


cv_tune_builder <- function (builder, params, x, y, cv=4, name="Test"){
    l=as.integer(nrow(x)/cv)
    accs <- NULL
    for(i in 0:(cv-1)){
        x_tr <- x[-(i*l+1):-(l*(i+1)),]; x_cv <- x[(i*l+1):(l*(i+1)),]; 
        y_tr <- y[-(i*l+1):-(l*(i+1)) ]; y_cv <- y[(i*l+1):(l*(i+1)) ];
        model <- builder(params)
        eph    = ifelse('epochs'     %in% names(params), params$epochs     , 30  )
        b_size = ifelse('batch_size' %in% names(params), params$batch_size , 10 )
        hist  <- model %>% fit (x_tr, y_tr,  epochs = eph, batch_size = b_size, validation_data = list(x_cv, y_cv))
        stats <- model %>% evaluate(x_test, y_test)
        accs <- c(accs, stats[[2]])
        mName <- paste(name, "_cv",i,".hdf5", sep="")
        save_model_hdf5(model, mName)
    }
    return (accs)
}


tune_builder <- function(builder, par_default, par_list, cv=4, verbose=FALSE, path="Models/Test/"){
    if(!dir.exists(path)){
        dir.create(path)
    }
    grid = expand.grid(par_list)
    mean_accs <- NULL
    best_acc <- 0.0
    par_best <- rlang::duplicate(par_default, shallow=FALSE)
    for(i in 1:nrow(grid)){
        par_copy <- rlang::duplicate(par_default, shallow=FALSE)
        mName <- "Model"
        for (name in names(par_list)){
            par_copy[[name]] <- grid[[name]][i]
            mName <- paste(mName,"_",name, grid[[name]][i], sep="")
        }
        data <- get_train_data(par_copy$n_bkg, par_copy$n_sig) #get dataset
        x <- data$x_train; y<-data$y_train;
        acc <- cv_tune_builder(builder, par_copy, x, y, cv, paste(path,mName, sep=""))
        mean_accs <- c(mean_accs, mean(acc))
        if(verbose){
            print("Parameters: ")
            print(par_copy)
            print("Accuracies:")
            print(acc)
            print(paste("Mean: ", mean(acc)))
        }
        if (mean(acc)>best_acc){
            best_acc <- mean(acc)
            par_best <- rlang::duplicate(par_copy, shallow=FALSE)
        }        
    }
    if(verbose){
        print("Best Parameters: ")
        print(par_best)
        print(paste("Accuracy:", best_acc))
    }
    grid$Mean_acc <- mean_accs
    #return(par_best)
    return (grid)
}