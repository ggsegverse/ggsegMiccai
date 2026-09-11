non_grey_labels <- c(
  "3rd Ventricle",
  "4th Ventricle",
  "Right Cerebellum White Matter",
  "Left Cerebellum White Matter",
  "Right Cerebral White Matter",
  "Left Cerebral White Matter",
  "CSF",
  "Right Inf Lat Vent",
  "Left Inf Lat Vent",
  "Right Lateral Ventricle",
  "Left Lateral Ventricle",
  "Right vessel",
  "Left vessel",
  "Optic Chiasm"
)

read_miccai_labels <- function(xml_file) {
  xml <- readLines(xml_file, warn = FALSE, encoding = "latin1")
  matches <- regmatches(
    xml,
    regexec("<index>([0-9]+)</index><name>([^<]+)</name>", xml)
  )
  matches <- Filter(function(match) length(match) == 3, matches)

  data.frame(
    idx = as.integer(vapply(matches, `[`, character(1), 2)),
    label = vapply(matches, `[`, character(1), 3)
  )
}

miccai_lut <- function(xml_file) {
  labels <- read_miccai_labels(xml_file)
  labels <- labels[!labels$label %in% non_grey_labels, ]

  region <- sub("^(Left|Right) ", "", labels$label)
  unique_regions <- unique(region)
  palette <- grDevices::col2rgb(
    grDevices::hcl.colors(length(unique_regions), "Dynamic")
  )
  colour_index <- match(region, unique_regions)

  data.frame(
    idx = labels$idx,
    label = labels$label,
    R = palette["red", colour_index],
    G = palette["green", colour_index],
    B = palette["blue", colour_index],
    A = 0L,
    type = ifelse(labels$idx >= 100L, "cortical", "subcortical")
  )
}
