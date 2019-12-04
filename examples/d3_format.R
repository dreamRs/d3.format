
x <- c(123456.789, 987654.321)
d3_format(",.2s")(x)


# Percentage
d3_format(".0%")(0.123)
d3_format(".1%")(0.123)
d3_format(".2%")(0.123)


# Fixed width
d3_format("20")(c(1, 10, 100))

# Grouped thousands with two significant digits
d3_format(",.2r")(c(4223, 8445, 24556))

