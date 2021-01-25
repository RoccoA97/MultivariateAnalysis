plot_all_cutting_features <- function(repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	ID_04 <- TRUE
	ID_15 <- TRUE

	breaks_ID_04_bkg <- 100;		breaks_ID_04_sig <- 100;		breaks_ID_04_lhcb <- 100;
	breaks_ID_15_bkg <- 100;		breaks_ID_15_sig <-  50;		breaks_ID_15_lhcb <- 100;



	if (ID_04) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$Lambda_b0_MM_F,
		     breaks=breaks_ID_04_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="Background Dataset"); box()

		hist(data.sig$Lambda_b0_MM_F,
		     breaks=breaks_ID_04_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="Signal Dataset");     box()

		hist(data.lhcb$Lambda_b0_MM_F,
		     breaks=breaks_ID_04_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="LHCb Dataset");       box()
	}



	if (ID_15) {
		par(mfrow=c(1,3))
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.bkg$DeltaM_F,
		     breaks=breaks_ID_15_bkg, probability=TRUE, col="firebrick3",
		     xlab=expression(paste(Delta, "M", " [MeV/c^2]")), main="Background Dataset"); box()

		hist(data.sig$DeltaM_F,
		     breaks=breaks_ID_15_sig, probability=TRUE, col="navy",
		     xlab=expression(paste(Delta, "M", " [MeV/c^2]")), main="Signal Dataset");     box()

		hist(data.lhcb$DeltaM_F,
		     breaks=breaks_ID_15_lhcb, probability=TRUE, col="darkgreen",
		     xlab=expression(paste(Delta, "M", " [MeV/c^2]")), main="LHCb Dataset");       box()
	}

}
