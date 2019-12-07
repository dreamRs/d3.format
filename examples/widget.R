library(d3.format)

dat <- data.frame(
  x = c("format", "numeric", "values", "with ease"),
  y = c(1233172L, 1467863L, 1953877L, 1382088L)
)


# With highcharter
library(highcharter)
hchart(dat, mapping = hcaes(x, y), type = "column") %>%
  use_d3_format() %>%
  hc_yAxis(labels = list(
    formatter = d3_format_js(",.3~s", suffix = " unit")
  ))

# with apexcharter
library(apexcharter)
apex(dat, aes(x, y), "column") %>%
  use_d3_format() %>%
  ax_yaxis(labels = list(
    formatter =  d3_format_js("$.3~s", suffix = " unit")
  ))


# With billboarder
library(billboarder)
billboarder(data = dat) %>%
  bb_aes(x = x, y = y) %>%
  bb_barchart() %>%
  use_d3_format() %>%
  bb_y_axis(
    tick = list(
      format = d3_format_js("$.3~s", suffix = " unit")
    )
  )

# with echarts4r
library(echarts4r)
dat %>%
  e_charts(x) %>%
  use_d3_format() %>%
  e_bar(y, name = "Serie 1") %>%
  e_y_axis(
    formatter = d3_format_js(",.3~s", suffix = " unit"),
    offset = -10
  )
