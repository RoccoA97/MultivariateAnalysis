drawPrediction <- function(builder, params, prob, cols, repr_plot_width=16, repr_plot_height=8, repr_plot_res=150){
    model <- builder(params)
    data  <- get_train_data(params$n_bkg)
    history  <- model %>% fit (data$x_train, data$y_train, verbose=0,
                     epochs=params$epochs, batch_size=params$batch_size, validation_split=0.2)
    y_cut_lhcb_pred <- model %>% predict(x_cut_lhcb)
    y_lhcb_pred     <- model %>% predict(x_lhcb)
    par(mfrow=c(1,2))
    options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)
    hist(data.lhcb$Lambda_b0_MM_F[y_lhcb_pred>=0.0], breaks=100, col="blue", xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="LHCb Dataset",  probability=FALSE)
	box()
    for(i in 1:length(prob)){
        hist(data.lhcb$Lambda_b0_MM_F[y_lhcb_pred>prob[i]],   breaks=100, col=cols[i], add=TRUE)
    }
    legend(6000, 13000, legend=c(paste("Optimizer: ", params$optimizer),"Full Dataset", paste("Threshold =",prob)),
           fill=c("white", "blue", cols), border="white", bty='n', x.intersp = 0.5)
    hist(data.cutted.lhcb$Lambda_b0_MM_F[y_cut_lhcb_pred>=0.0], breaks=100, col="blue", xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="LHCb Cutted Dataset",  probability=FALSE)
	box()
    for(i in 1:length(prob)){
        hist(data.cutted.lhcb$Lambda_b0_MM_F[y_cut_lhcb_pred>prob[i]],   breaks=100, col=cols[i], add=TRUE)
    }
    legend(6000,6000, legend=c(paste("Optimizer: ", params$optimizer),"Cutted Dataset", paste("Threshold =",prob)),
           fill=c("white", "blue",cols), border="white", bty='n', x.intersp = 0.5)
}

drawAllPrediction <- function(prob, cols, repr_plot_width=16, repr_plot_height=8, repr_plot_res=150){
    drawPrediction(Archi_build_model, ArchiParams_RMS  , prob, cols, repr_plot_width=repr_plot_width, repr_plot_height=repr_plot_height, repr_plot_res=repr_plot_res)
    drawPrediction(Archi_build_model, ArchiParams_ADAM , prob, cols, repr_plot_width=repr_plot_width, repr_plot_height=repr_plot_height, repr_plot_res=repr_plot_res)
    drawPrediction(Archi_build_model, ArchiParams_NADAM, prob, cols, repr_plot_width=repr_plot_width, repr_plot_height=repr_plot_height, repr_plot_res=repr_plot_res)
    drawPrediction(Archi_build_model, ArchiParams_SGD  , prob, cols, repr_plot_width=repr_plot_width, repr_plot_height=repr_plot_height, repr_plot_res=repr_plot_res)
}
