plot_all_input_features <- function(repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	ID_03 <- TRUE
	ID_06 <- TRUE
	ID_07 <- TRUE
	ID_08 <- TRUE
	ID_09 <- TRUE
	ID_10 <- TRUE
	ID_11 <- TRUE
	ID_12 <- TRUE
	ID_14 <- TRUE
	ID_17 <- TRUE
	ID_18 <- TRUE

	breaks_ID_03_bkg <-  30;		breaks_ID_03_sig <-  30;		breaks_ID_03_lhcb <-  30;
	breaks_ID_06_bkg <- 100;		breaks_ID_06_sig <- 100;		breaks_ID_06_lhcb <-  25;
	breaks_ID_07_bkg <- 100;		breaks_ID_07_sig <-  25;		breaks_ID_07_lhcb <- 100;
	breaks_ID_08_bkg <- 100;		breaks_ID_08_sig <-  25;		breaks_ID_08_lhcb <- 100;
	breaks_ID_09_bkg <- 100;		breaks_ID_09_sig <-  25;		breaks_ID_09_lhcb <- 100;
	breaks_ID_10_bkg <- 100;		breaks_ID_10_sig <-  25;		breaks_ID_10_lhcb <- 100;
	breaks_ID_11_bkg <- 100;		breaks_ID_11_sig <-  25;		breaks_ID_11_lhcb <- 100;
	breaks_ID_12_bkg <- 100;		breaks_ID_12_sig <-  25;		breaks_ID_12_lhcb <- 100;
	breaks_ID_14_bkg <-  25;		breaks_ID_14_sig <-  25;		breaks_ID_14_lhcb <-  25;
	breaks_ID_17_bkg <- 100;		breaks_ID_17_sig <-  25;		breaks_ID_17_lhcb <- 100;
	breaks_ID_18_bkg <- 100;		breaks_ID_18_sig <-  25;		breaks_ID_18_lhcb <- 100;


	if (ID_03) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$Lambda_c_MM_F,
		     breaks=breaks_ID_03_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Lambda[c]^'+', " Mass [MeV/c^2]")), main="Background Dataset"); box()

		hist(data.sig$Lambda_c_MM_F,
		     breaks=breaks_ID_03_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Lambda[c]^'+', " Mass [MeV/c^2]")), main="Signal Dataset");     box()

		hist(data.lhcb$Lambda_c_MM_F,
		     breaks=breaks_ID_03_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Lambda[c]^'+', " Mass [MeV/c^2]")), main="LHCb Dataset");       box()
	}



	if (ID_06) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcZDecLSigma_F[data.bkg$lcZDecLSigma_F<30 & data.bkg$lcZDecLSigma_F>-5],
		     breaks=breaks_ID_06_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Lambda[c]^"+", " z decay length over error")), main="Background Dataset"); box()

		hist(data.sig$lcZDecLSigma_F[data.sig$lcZDecLSigma_F<30 & data.sig$lcZDecLSigma_F>-5],
		     breaks=breaks_ID_06_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Lambda[c]^"+", " z decay length over error")), main="Signal Dataset");     box()

		hist(data.lhcb$lcZDecLSigma_F[data.lhcb$lcZDecLSigma_F<30 & data.lhcb$lcZDecLSigma_F>-5],
		     breaks=breaks_ID_06_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Lambda[c]^"+", " z decay length over error")), main="LHCb Dataset");       box()
	}



	if (ID_07) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcstarZDecLSigma_F,
		     breaks=breaks_ID_07_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Lambda[c]^"+*", " z decay length over error")), main="Background Dataset"); box()

		hist(data.sig$lcstarZDecLSigma_F,
		     breaks=breaks_ID_07_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Lambda[c]^"+*", " z decay length over error")), main="Signal Dataset");     box()

		hist(data.lhcb$lcstarZDecLSigma_F,
		     breaks=breaks_ID_07_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Lambda[c]^"+*", " z decay length over error")), main="LHCb Dataset");       box()
	}



	if (ID_08) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcDecTime_F[data.bkg$lcDecTime_F<1 & data.bkg$lcDecTime_F>-1],
		     breaks=breaks_ID_08_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste({t^"decay"}[Lambda[c]], " [ps]")), main="Background Dataset"); box()

		hist(data.sig$lcDecTime_F[data.sig$lcDecTime_F<1 & data.sig$lcDecTime_F>-1],
		     breaks=breaks_ID_08_sig, probability=TRUE, col="navy",
		     xlab=expression(paste({t^"decay"}[Lambda[c]], " [ps]")), main="Signal Dataset");     box()

		hist(data.lhcb$lcDecTime_F[data.lhcb$lcDecTime_F<1 & data.lhcb$lcDecTime_F>-1],
		     breaks=breaks_ID_08_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste({t^"decay"}[Lambda[c]], " [ps]")), main="LHCb Dataset");       box()
	}



	if (ID_09) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcstarDecTime_F[data.bkg$lcstarDecTime_F<1 & data.bkg$lcstarDecTime_F>-1],
		     breaks=breaks_ID_09_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste({t^"decay"}[Lambda[c]^"*"], " [ps]")), main="Background Dataset"); box()

		hist(data.sig$lcstarDecTime_F[data.sig$lcstarDecTime_F<1 & data.sig$lcstarDecTime_F>-1],
		     breaks=breaks_ID_09_sig, probability=TRUE, col="navy",
		     xlab=expression(paste({t^"decay"}[Lambda[c]^"*"], " [ps]")), main="Signal Dataset");     box()

		hist(data.lhcb$lcstarDecTime_F[data.lhcb$lcstarDecTime_F<1 & data.lhcb$lcstarDecTime_F>-1],
		     breaks=breaks_ID_09_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste({t^"decay"}[Lambda[c]^"*"], " [ps]")), main="LHCb Dataset");       box()
	}



	if (ID_10) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lbDecTime_F[data.bkg$lbDecTime_F<10],
		     breaks=breaks_ID_10_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste({t^"decay"}[Lambda[b]], " [ps]")), main="Background Dataset"); box()

		hist(data.sig$lbDecTime_F[data.sig$lbDecTime_F<10],
		     breaks=breaks_ID_10_sig, probability=TRUE, col="navy",
		     xlab=expression(paste({t^"decay"}[Lambda[b]], " [ps]")), main="Signal Dataset");     box()

		hist(data.lhcb$lbDecTime_F[data.lhcb$lbDecTime_F<10],
		     breaks=breaks_ID_10_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste({t^"decay"}[Lambda[b]], " [ps]")), main="LHCb Dataset");       box()
	}



	if (ID_11) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcDecVerChi2_F,
		     breaks=breaks_ID_11_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+", " decay vertex")), main="Background Dataset"); box()

		hist(data.sig$lcDecVerChi2_F,
		     breaks=breaks_ID_11_sig, probability=TRUE, col="navy",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+", " decay vertex")), main="Signal Dataset");     box()

		hist(data.lhcb$lcDecVerChi2_F,
		     breaks=breaks_ID_11_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+", " decay vertex")), main="LHCb Dataset");       box()
	}



	if (ID_12) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$lcstarDecVerChi2_F,
		     breaks=breaks_ID_12_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+*", " decay vertex")), main="Background Dataset"); box()

		hist(data.sig$lcstarDecVerChi2_F,
		     breaks=breaks_ID_12_sig, probability=TRUE, col="navy",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+*", " decay vertex")), main="Signal Dataset");     box()

		hist(data.lhcb$lcstarDecVerChi2_F,
		     breaks=breaks_ID_12_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste("Probability of ", Lambda[c]^"+*", " decay vertex")), main="LHCb Dataset");       box()
	}



	if (ID_14) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$Lambda_b0_DIRA_OWNPV_F,
		     breaks=breaks_ID_14_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Lambda[b]^"0", " DIRA of PV")), main="Background Dataset"); box()

		hist(data.sig$Lambda_b0_DIRA_OWNPV_F,
		     breaks=breaks_ID_14_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Lambda[b]^"0", " DIRA of PV")), main="Signal Dataset");     box()

		hist(data.lhcb$Lambda_b0_DIRA_OWNPV_F,
		     breaks=breaks_ID_14_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Lambda[b]^"0", " DIRA of PV")), main="LHCb Dataset");       box()
	}



	if (ID_17) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$pair0_3pi_F,
		     breaks=breaks_ID_17_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste("Pair mass of pions 1", " [MeV/c^2]")), main="Background Dataset"); box()

		hist(data.sig$pair0_3pi_F,
		     breaks=breaks_ID_17_sig, probability=TRUE, col="navy",
		     xlab=expression(paste("Pair mass of pions 1", " [MeV/c^2]")), main="Signal Dataset");     box()

		hist(data.lhcb$pair0_3pi_F,
		     breaks=breaks_ID_17_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste("Pair mass of pions 1", " [MeV/c^2]")), main="LHCb Dataset");       box()
	}



	if (ID_18) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$pair1_3pi_F,
		     breaks=breaks_ID_18_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste("Pair mass of pions 2", " [MeV/c^2]")), main="Background Dataset"); box()

		hist(data.sig$pair1_3pi_F,
		     breaks=breaks_ID_18_sig, probability=TRUE, col="navy",
		     xlab=expression(paste("Pair mass of pions 2", " [MeV/c^2]")), main="Signal Dataset");     box()

		hist(data.lhcb$pair1_3pi_F,
		     breaks=breaks_ID_18_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste("Pair mass of pions 2", " [MeV/c^2]")), main="LHCb Dataset");       box()
	}

}
