#' Countdown Widget
#'
#' Odmoter JS R Wrapper
#'
#' @param count Value to animate
#' @param duration Milliseconds
#' @param format Value format
#' @param width,height Dimensions
#' @param elementId Id of element
#'
#' @examples
#' countdown(347)
#'
#' @import htmlwidgets
#'
#' @export
countdown <- function(count, duration = 2500, format = "(,ddd).dd", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    value = count,
    opts = list(
      duration = duration,
      format = format,
      theme = 'default'
    )
  )


  # create dependency
  path <- system.file("htmlwidgets/lib/odometer", package = "countdown")
  dep <- htmltools::htmlDependency(
    name = "defaulttheme",
    version = "0.4.8",
    src = c(file = path),
    stylesheet = "odometer-theme-default.css"
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'countdown',
    x,
    width = width,
    height = height,
    package = 'countdown',
    elementId = elementId,
    dependencies = list(dep),
    sizingPolicy = htmlwidgets::sizingPolicy(
      defaultWidth = "auto",
      defaultHeight = "auto",
      padding = 0
    )
  )
}

#' Shiny bindings for countdown
#'
#' Output and render functions for using countdown within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a countdown
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name countdown-shiny
#'
#' @export
countdownOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'countdown', width, height, package = 'countdown')
}

#' @rdname countdown-shiny
#' @export
renderCountdown <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, countdownOutput, env, quoted = TRUE)
}
