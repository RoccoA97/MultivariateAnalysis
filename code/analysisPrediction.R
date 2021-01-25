Sig_expect <- 7330

len_sig      <- Vectorize(function(pred, p){
    length(data.lhcb$Lambda_b0_MM_F[data.lhcb$Lambda_b0_MM_F>5550 & data.lhcb$Lambda_b0_MM_F<5680 & pred>=p]) }, vectorize.args = 'p')
len_sig_cut  <- Vectorize(function(pred, p){
    length(data.cutted.lhcb$Lambda_b0_MM_F[data.cutted.lhcb$Lambda_b0_MM_F>5550 & 
                            data.cutted.lhcb$Lambda_b0_MM_F<5680 & pred>=p]) }, , vectorize.args = 'p')

len_sig_false      <- Vectorize(function(pred, p){
    length(data.lhcb$Lambda_b0_MM_F[(data.lhcb$Lambda_b0_MM_F<5550 | data.lhcb$Lambda_b0_MM_F>5680) & pred>=p]) }, vectorize.args = 'p')
len_sig_false_cut  <- Vectorize(function(pred, p){
    length(data.cutted.lhcb$Lambda_b0_MM_F[(data.cutted.lhcb$Lambda_b0_MM_F>5550 | 
                            data.cutted.lhcb$Lambda_b0_MM_F>5680) & pred>=p]) }, , vectorize.args = 'p')

PredictionAnalysis <- function(builder, params, prob){
    model <- builder(params)
    data  <- get_train_data(params$n_bkg) 
    history  <- model %>% fit (data$x_train, data$y_train, verbose=0,
                     epochs=params$epochs, batch_size=params$batch_size, validation_split=0.2)
    y_cut_lhcb_pred <- model %>% predict(x_cut_lhcb)
    y_lhcb_pred     <- model %>% predict(x_lhcb)
    ntot     <- length(data.lhcb$Lambda_b0_MM_F)
    ntot_cut <- length(data.cutted.lhcb$Lambda_b0_MM_F)
    nsig     <- len_sig    (y_lhcb_pred     ,prob) 
    nsig_cut <- len_sig_cut(y_cut_lhcb_pred ,prob)
    nsig_false     <- len_sig_false    (y_lhcb_pred     ,prob) 
    nsig_false_cut <- len_sig_false_cut(y_cut_lhcb_pred ,prob)

    nbkg     <- ntot     - nsig     -  nsig_false    
    nbkg_cut <- ntot_cut - nsig_cut -  nsig_false_cut
    lost_sig     <- (Sig_expect -nsig    ) / Sig_expect  #signal not detected
    lost_sig_cut <- (Sig_expect -nsig_cut) / Sig_expect  #signal not detected
    miss_Bkg     <- nsig_false     / (ntot     - Sig_expect)  #missclassified bkg
    miss_Bkg_cut <- nsig_false_cut / (ntot_cut - Sig_expect)  #missclassified bkg
    
    result <- data.frame(prob=prob, nSig   =nsig    , nBkg   =nbkg,     LostSig   =lost_sig,     FalseSig   =miss_Bkg,
                                    nSigCut=nsig_cut, nBkgCut=nbkg_cut, LostSigCut=lost_sig_cut, FalseSigCut=miss_Bkg_cut)
    return (result)
}