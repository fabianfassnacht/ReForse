#' Turn Matrix
#'
#' @author Fabian Fassnacht via Internet (find real source!!)
#' @param al angle around which the matrix shall to be turned
#' @param x vector of x values
#' @param y vector of y values
#' @param z vector of z values

turn_mat <- function(al, x, y, z) {

  t_pcl_min_x <- min(x)
  t_pcl_max_x <- max(x)
  t_pcl_min_y <- min(y)
  t_pcl_max_y <- max(y)

  xcen <- ((t_pcl_max_x - t_pcl_min_x)/2.0)+t_pcl_min_x
  ycen <- ((t_pcl_max_y - t_pcl_min_y)/2.0)+t_pcl_min_y

  x <- x - xcen
  y <- y - ycen

  newx <- cos(al*pi/180) * x - sin(al*pi/180) * y
  newy <- sin(al*pi/180) * x + cos(al*pi/180) * y

  newx2 <- newx + xcen
  newy2 <- newy + ycen

  out <- c(newx2, newy2, z)
  out2 <- matrix(out, nrow=length(x), ncol=3)
  colnames(out2) <- c("x", "y", "z")
  out2
}