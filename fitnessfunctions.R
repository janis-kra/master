library(fmsb)

setwd("/Users/jk/Documents/Uni/master/thesis/gfx")

fullCbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7", "#999999", "#E69F00", "#56B4E9", "#009E73")

fitness.maxmin <- data.frame(
  latency=c(5,0),
  throughput=c(5,0),
  availability=c(5,0),
  compatibility=c(5,0),
  evolvability=c(5,0),
  scalability=c(5,0),
  security=c(5,0),
  acquisition=c(5,0),
  legal=c(5,0)
)
fitness.impl.data <- data.frame(
  latency=c(0),
  throughput=c(0),
  availability=c(0),
  compatibility=c(5),
  evolvability=c(4),
  scalability=c(2),
  security=c(4),
  acquisition=c(5),
  legal=c(5)
)

fitness.impl <- rbind(fitness.maxmin, fitness.impl.data)

labels <- c(
  "Low\nLatency",
  "High\nThroughput",
  "High\nAvailability",
  "Compatibility",
  "Evolvability",
  "Scalability",
  "Data\nSecurity",
  "Acquisition\nCost",
  "Legal\nRequirements"
)

pdf("fitness-function-impl.pdf", 9, 8)
radarchart(fitness.impl, axistype=2, seg=5, plty=1, vlabels=labels, 
           title="IFAS Fitness Function (Implementation)", vlcex=1, pfcol=fullCbbPalette[4],
           pty=32)
dev.off()

fitness.eval <- rbind(fitness.maxmin, data.frame(
  latency=c(2),
  throughput=c(3),
  availability=c(0),
  compatibility=c(5),
  evolvability=c(4),
  scalability=c(2),
  security=c(4),
  acquisition=c(5),
  legal=c(5)
))

pdf("fitness-function-eval.pdf", 9, 8)
radarchart(fitness.eval, axistype=2, seg=5, plty=1, vlabels=labels, 
           title="IFAS Fitness Function (Evaluation)", vlcex=1, pfcol=fullCbbPalette[4],
           pty=32)
dev.off()


example.maxmin <- data.frame(
  throughput=c(5,0),
  availability=c(5,0),
  coupling=c(5,0),
  legal=c(5,0)
)
example.data <- data.frame(
  throughput=c(5),
  availability=c(3),
  coupling=c(1),
  legal=c(2)
)

example.labels <- c(
  "Throughput",
  "Availability",
  "Module\nCoupling",
  "Legal\nRequirements"
)

example <- rbind(example.maxmin, example.data)

pdf("fitness-function-example.pdf", 9, 8)
radarchart(example, axistype=2, seg=5, plty=1, vlabels=example.labels, 
           title="Example Fitness Function", vlcex=1, pfcol=fullCbbPalette[4],
           pty=32)
dev.off()
