plot_signal_estimation <- function(repr_plot_width=12, repr_plot_height=4, repr_plot_res=250,
                                  min = 5100, max = 5800, nb = 180) {

    data.lhcb.preSig <- data.lhcb$Lambda_b0_MM_F[data.lhcb$Lambda_b0_MM_F <5550 | data.lhcb$Lambda_b0_MM_F >5680]
    data.lhcb.preSig <- data.lhcb.preSig[data.lhcb.preSig>min & data.lhcb.preSig<max]

    h1<-hist(data.lhcb.preSig, breaks=nb, col="firebrick3",  xlab=expression(paste(Lambda[b]^0, " Mass")), main="LHCb data")
    box()
    temp <- data.frame(x=h1$mids[h1$count!=0], y=h1$counts[h1$count!=0])
    mod <- lm(y~x, data = temp )

    q <-as.numeric(mod[1]$coefficients[1])
    m <-as.numeric(mod[1]$coefficients[2])

    lines(temp$x, temp$x*m+q, col='darkgreen', lwd=5)
    midSig <- h1$mid[h1$counts==0]
    expected_bkg <- sum(midSig*m+q)
    expected_sig <- as.integer(length(data.lhcb$Lambda_b0_MM_F[
                                      data.lhcb$Lambda_b0_MM_F >5550 &
                                      data.lhcb$Lambda_b0_MM_F <5680]) - expected_bkg)
    return(expected_sig)
}
