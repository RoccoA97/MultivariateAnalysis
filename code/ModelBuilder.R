getOptimizer <- function (params){
    if (params$optimizer == "rmsprop"){
        return (optimizer_rmsprop(lr = params$lr, rho=params$rho))}
    if (params$optimizer == "adam"){
        return (optimizer_adam(lr = params$lr, beta_1 = params$beta_1, 
                                               beta_2 = params$beta_2 ))}
    if (params$optimizer == "nadam"){
        return (optimizer_nadam(lr = params$lr, beta_1 = params$beta_1, 
                                                beta_2 = params$beta_2 ))}
    if (params$optimizer == "sgd"){
        return (optimizer_sgd(lr = params$lr, momentum = params$momentum, 
                               decay = 1e-6, nesterov = TRUE)) }
}

#builder with full params choice
Archi_build_model <- function(params){
    model <- keras_model_sequential()
    model %>%
      layer_dense(units = params$unit1, activation = params$act_dense, 
                  input_shape = c(params$nFeat), 
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout1) %>%
      layer_dense(units = params$unit2, activation = params$act_dense,  
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout2) %>%
      layer_dense(units = params$unit3, activation = params$act_dense, 
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout3) %>%
      layer_dense(units = 1, activation = params$act_final)

    model %>% compile(
      loss = params$loss,
      optimizer = getOptimizer(params),
      metrics = c('accuracy')
    )
    return(model)
}

#basic builder with some params
build_model <- function(params){
    model <- keras_model_sequential()
    model %>%
      layer_dense(units = params$unit1, activation = 'relu', 
                  input_shape = c(params$nFeat), 
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout1) %>%
      layer_dense(units = params$unit2, activation = 'relu',  
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout2) %>%
      layer_dense(units = params$unit3, activation = 'relu', 
                  kernel_regularizer=regularizer_l1_l2(l1=params$l1_coeff, l2=params$l2_coeff)) %>%
      layer_dropout(rate = params$dropout3) %>%
      layer_dense(units = 1, activation = 'sigmoid')

    model %>% compile(
      loss = 'binary_crossentropy',
      optimizer = optimizer_rmsprop(),
      metrics = c('accuracy')
    )
    return(model)
}








trainModel <- function(builder, params){ 
    model <- builder(params)
    data  <- get_train_data(params$n_bkg) 
    history  <- model %>% fit (data$x_train, data$y_train, verbose=2,
                     epochs=params$epochs, batch_size=params$batch_size, validation_split=0.2)
    return(model)
}
