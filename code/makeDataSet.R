#make cutted data set
data.cutted.bkg  <-  data.bkg  %>% dplyr::filter( (Lambda_b0_MM_F > 5550 &  Lambda_b0_MM_F < 5680 ) |  DeltaM_F < 360)
data.cutted.sig  <-  data.sig  %>% dplyr::filter( (Lambda_b0_MM_F > 5550 &  Lambda_b0_MM_F < 5680 ) |  DeltaM_F < 360)
data.cutted.lhcb <-  data.lhcb %>% dplyr::filter( (Lambda_b0_MM_F > 5550 &  Lambda_b0_MM_F < 5680 ) |  DeltaM_F < 360)


# make test set
sel_features <- c(3, 6, 7, 8, 9, 10, 11, 12, 14, 17, 18)
nt_bkg <- 400; nt_sig <- 400

#get 400 BKG and Signal
x_test_bkg  <- as.matrix(data.bkg[1:nt_bkg, sel_features])
x_test_sig  <- as.matrix(data.sig[1:nt_sig, sel_features])
y_test_bkg  <- as.vector(matrix(0, nrow=nt_bkg, ncol=1))
y_test_sig  <- as.vector(matrix(1, nrow=nt_sig, ncol=1))

#bind scale and reshuffle
x_test  <- rbind(x_test_bkg  , x_test_sig  )
y_test  <-     c(y_test_bkg  , y_test_sig  )
x_test  <- scale(x_test )

shuffle_test  <- sample(nrow(x_test ))
x_test  <- x_test [shuffle_test,]
y_test  <- y_test [shuffle_test] 

#make full data set for background
x_train_bkg_full <- as.matrix(data.bkg[-1:-nt_bkg, sel_features])
x_train_sig_full <- as.matrix(data.sig[-1:-nt_sig, sel_features])

y_train_bkg_full <- as.vector(matrix(0, nrow=nrow(x_train_bkg_full), ncol=1))
y_train_sig_full <- as.vector(matrix(1, nrow=nrow(x_train_sig_full), ncol=1))

#get a training set with specified number of bkg and signak events
get_train_data <- function(n_bkg, n_sig=1090 ){
    x_bkg <- x_train_bkg_full[1:n_bkg, ]
    x_sig <- x_train_sig_full[1:n_sig, ]
    x_t   <- rbind(x_bkg, x_sig)
    y_t   <- c(y_train_bkg_full[1:n_bkg], y_train_sig_full[1:n_sig])
    sffl  <- sample(nrow(x_t))
    
    x_t   <- x_t[sffl,]
    x_t   <- scale(x_t)
    y_t   <- y_t[sffl] 
    return (list(x_train=x_t, y_train=y_t))
}

# lhcb data cutted and full
x_lhcb     <- as.matrix(       data.lhcb[, sel_features])
x_cut_lhcb <- as.matrix(data.cutted.lhcb[, sel_features])

x_lhcb     <- scale(x_lhcb)
x_cut_lhcb <- scale(x_cut_lhcb)
