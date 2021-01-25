################################################################################
################################################################################
plot_dataset_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Background events"
	ylab  <- "Background events"
	title <- "Dataset fraction tuning"

	grid    <- read.table(file.txt)
	xticks  <- factor(grid[,1])
	yticks  <- factor("Bkg")
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_batch_epochs_grid <- function(file.txt, repr_plot_width=4, repr_plot_height=4, repr_plot_res=250) {

	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Batch size"
	ylab  <- "Epochs"
	title <- "(Batch size, Epochs) tuning"

	grid    <- read.table(file.txt)
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_unit_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,3))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Unit 1 neurons"
	ylab  <- "Unit 2 neurons"
	title <- "(Unit 1, Unit 2, Unit 3 = 64) tuning"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g1 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "Unit 1 neurons"
	ylab  <- "Unit 2 neurons"
	title <- "(Unit 1, Unit 2, Unit 3 = 32) tuning"

	grid    <- read.table(file.txt[2])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g2 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "Unit 1 neurons"
	ylab  <- "Unit 2 neurons"
	title <- "(Unit 1, Unit 2, Unit 3 = 16) tuning"

	grid    <- read.table(file.txt[3])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g3 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

	grid.arrange(g1, g2, g3, nrow=1)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_dropout_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,3))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Dropout Layer 1"
	ylab  <- "Dropout Layer 2"
	title <- "(Dropout 1, Dropout 2, Dropout 3 = 0.1) tuning"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g1 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "Dropout Layer 1"
	ylab  <- "Dropout Layer 2"
	title <- "(Dropout 1, Dropout 2, Dropout 3 = 0.2) tuning"

	grid    <- read.table(file.txt[2])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g2 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "Dropout Layer 1"
	ylab  <- "Dropout Layer 2"
	title <- "(Dropout 1, Dropout 2, Dropout 3 = 0.3) tuning"

	grid    <- read.table(file.txt[3])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g3 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

	grid.arrange(g1, g2, g3, nrow = 1)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_actI_actF_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Activation First Layer"
	ylab  <- "Activation Last Layer"
	title <- "(First, Last) Layer Activation tuning"

	grid    <- read.table(file.txt)
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_loss_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "Loss function"
	ylab  <- "Loss function"
	title <- "Loss function tuning"

	grid    <- read.table(file.txt)
	xticks  <- factor(grid[,1])
	yticks  <- factor("Loss")
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_optimizer_rms_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,4))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

	xlab  <- "learning rate"
	ylab  <- "rho"
	title <- "RMSProp(lr, rho) tuning"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_optimizer_adam_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,3))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "ADAM(lr, beta1, beta2 = 0.990) tuning"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g1 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "ADAM(lr, beta1, beta2 = 0.995) tuning"

	grid    <- read.table(file.txt[2])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g2 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "ADAM(lr, beta1, beta2 = 0.999) tuning"

	grid    <- read.table(file.txt[3])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g3 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

	grid.arrange(g1, g2, g3, nrow=1)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_optimizer_nadam_grid <- function(file.txt, repr_plot_width=12, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,3))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "NADAM(lr, beta1, beta2 = 0.990) tuning"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g1 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "NADAM(lr, beta1, beta2 = 0.995) tuning"

	grid    <- read.table(file.txt[2])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g2 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)


	xlab  <- "learning rate"
	ylab  <- "beta 1"
	title <- "NADAM(lr, beta1, beta2 = 0.999) tuning"

	grid    <- read.table(file.txt[3])
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g3 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))   +
	geom_tile(aes(fill=accs), colour="white")               +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1) +
	scale_fill_continuous(low="yellow",high="red")          +
	theme_bw()                                              +
	theme(legend.position="none")                           +
	xlab(xlab)                                              +
	ylab(ylab)                                              +
	ggtitle(title)                                          +
	theme(plot.title=element_text(hjust=0.5))               +
	coord_cartesian(expand=FALSE)

	grid.arrange(g1, g2, g3, nrow=1)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_optimizer_sgd_grid <- function(file.txt, repr_plot_width=6, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,4))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)

	xlab  <- "learning rate"
	ylab  <- "momentum"
	title <- "SGD(lr, momentum) tuning"

	grid    <- read.table(file.txt)
	xticks  <- factor(grid[,2])
	yticks  <- factor(grid[,3])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)

}
################################################################################
################################################################################



################################################################################
################################################################################
plot_l1_l2_grid <- function(file.txt, repr_plot_width=16, repr_plot_height=4, repr_plot_res=250) {

	par(mfrow=c(1,4))
	options(repr.plot.width=repr_plot_width, repr.plot.height=repr_plot_height, repr.plot.res=repr_plot_res)


	xlab  <- "L1 regularizer"
	ylab  <- "L2 regularizer"
	title <- "Regularization for RMSProp optimizer"

	grid    <- read.table(file.txt[1])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g1 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)


	xlab  <- "L1 regularizer"
	ylab  <- "L2 regularizer"
	title <- "Regularization for ADAM optimizer"

	grid    <- read.table(file.txt[2])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g2 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)


	xlab  <- "L1 regularizer"
	ylab  <- "L2 regularizer"
	title <- "Regularization for NADAM optimizer"

	grid    <- read.table(file.txt[3])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g3 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)


	xlab  <- "L1 regularizer"
	ylab  <- "L2 regularizer"
	title <- "Regularization for SGD optimizer"

	grid    <- read.table(file.txt[4])
	xticks  <- factor(grid[,1])
	yticks  <- factor(grid[,2])
	accs    <- grid[,"Mean_acc"]
	grid.df <- data.frame(xticks, yticks, accs)

	g4 <-
	ggplot(data=grid.df, mapping=aes(x=xticks, y=yticks))     +
	geom_tile(aes(fill=accs), colour="white")                 +
	geom_text(aes(label = sprintf("%1.4f", accs)), vjust=1)   +
	scale_fill_continuous(low="yellow",high="red")            +
	theme_bw()                                                +
	theme(legend.position="none")                             +
	xlab(xlab)                                                +
	ylab(ylab)                                                +
	ggtitle(title)                                            +
	theme(plot.title=element_text(hjust=0.5))                 +
	coord_cartesian(expand=FALSE)

	grid.arrange(g1, g2, g3, g4, nrow=1)

}
################################################################################
################################################################################
