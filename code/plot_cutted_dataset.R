plot_cutted_dataset <- function(repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	ID_04 <- TRUE
	ID_15 <- TRUE

	breaks_ID_04_lhcb_cutted <- 100;
	breaks_ID_15_lhcb_cutted <- 100;



	if (ID_04) {
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.cutted.lhcb$Lambda_b0_MM_F,
		     breaks=breaks_ID_04_lhcb_cutted, col="darkgreen",
		     xlab=expression(paste(Lambda[b]^0, " Mass", " [MeV/c^2]")), main="LHCb Cutted Dataset"); box()
	}



	if (ID_15) {
		options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

		hist(data.cutted.lhcb$DeltaM_F,
		     breaks=breaks_ID_15_lhcb_cutted, col="darkgreen",
		     xlab=expression(paste(Delta, "M", " [MeV/c^2]")), main="LHCb Cutted Dataset");       box()
	}

}
