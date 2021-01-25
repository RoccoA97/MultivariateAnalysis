# in this files all the parameters used for the model tuning are reported
#the first 4 ("ArchiParams_Optimizer") are the best parameters found for each optimizer

sel_features <- c(3, 6, 7, 8, 9, 10, 11, 12, 14, 17, 18)

ArchiParams_RMS <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-5                  ),
    flag_numeric("l2_coeff"   , 1e-4                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "hard_sigmoid"        ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "rmsprop"             ),
    flag_numeric("lr"         , 0.003                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)

ArchiParams_ADAM <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-5                  ),
    flag_numeric("l2_coeff"   , 1e-2                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "hard_sigmoid"        ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "adam"                ),
    flag_numeric("lr"         , 0.001                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.93                  ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.995                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)


ArchiParams_NADAM <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-4                  ),
    flag_numeric("l2_coeff"   , 1e-4                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "hard_sigmoid"        ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "nadam"               ),
    flag_numeric("lr"         , 5e-4                  ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.995                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)

ArchiParams_SGD <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 0.0                   ),
    flag_numeric("l2_coeff"   , 0.0                   ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "hard_sigmoid"        ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "sgd"                 ),
    flag_numeric("lr"         , 5e-4                  ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)



ArchiParams_TunedOpt <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-4                  ),
    flag_numeric("l2_coeff"   , 1e-5                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "sigmoid"             ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "rmsprop"             ),
    flag_numeric("lr"         , 0.001                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)


ArchiParams_TunedLayers <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-4                  ),
    flag_numeric("l2_coeff"   , 1e-5                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "hard_sigmoid"        ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "rmsprop"             ),
    flag_numeric("lr"         , 0.001                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)

ArchiParams_TunedUnit <- flags(
    flag_numeric("dropout1"   , 0.3                   ),
    flag_numeric("dropout2"   , 0.3                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 64                    ),
    flag_numeric("unit2"      , 128                   ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-4                  ),
    flag_numeric("l2_coeff"   , 1e-5                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "sigmoid"             ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "rmsprop"             ),
    flag_numeric("lr"         , 0.001                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)


ArchiParams <- flags(
    flag_numeric("dropout1"   , 0.1                   ),
    flag_numeric("dropout2"   , 0.1                   ),
    flag_numeric("dropout3"   , 0.1                   ),
    flag_numeric("unit1"      , 128                   ),
    flag_numeric("unit2"      , 64                    ),
    flag_numeric("unit3"      , 32                    ),
    flag_numeric("nFeat"      , length(sel_features)  ),
    flag_numeric("l1_coeff"   , 1e-4                  ),
    flag_numeric("l2_coeff"   , 1e-5                  ),
    flag_string ("epochs"     , 5                     ),  
    flag_string ("batch_size" , 10                    ),
    flag_numeric("n_bkg"      , 1000                  ),
    flag_numeric("n_sig"      , 1090                  ),
    flag_string ("act_dense"  , "relu"                ),
    flag_string ("act_final"  , "sigmoid"             ),
    flag_string ("loss"       , "binary_crossentropy" ),
    flag_string ("optimizer"  , "rmsprop"             ),
    flag_numeric("lr"         , 0.001                 ), #learing rate for the optimizers
    flag_numeric("rho"        , 0.9                   ), #rms rho
    flag_numeric("beta_1"     , 0.9                   ), #beta1 adam/nadam
    flag_numeric("beta_2"     , 0.999                 ), #beta2 adam/nadam
    flag_numeric("momentum"   , 0.9                   ) #momentum sgd
)

TunerParams <- flags(
    flag_numeric("dropout1"   , 0.1                 ),
    flag_numeric("dropout2"   , 0.1                 ),
    flag_numeric("dropout3"   , 0.1                 ),
    flag_numeric("unit1"      , 128                 ),
    flag_numeric("unit2"      , 64                  ),
    flag_numeric("unit3"      , 32                  ),
    flag_numeric("nFeat"      , length(sel_features)),
    flag_numeric("l1_coeff"   , 1e-4                ),
    flag_numeric("l2_coeff"   , 1e-5                ),
    flag_string ("epochs"     , 30                  ),  
    flag_string ("batch_size" , 10                  ),
    flag_numeric("n_bkg"      , 1000                ),
    flag_numeric("n_sig"      , 1090                )            
)



ModelParams <- flags(
    flag_numeric("dropout1", 0.1),
    flag_numeric("dropout2", 0.1),
    flag_numeric("dropout3", 0.1),
    flag_numeric("unit1", 128),
    flag_numeric("unit2", 64),
    flag_numeric("unit3", 32),
    flag_numeric("nFeat", length(sel_features)),
    flag_numeric("l1_coeff", 1e-4),
    flag_numeric("l2_coeff", 1e-5)
)