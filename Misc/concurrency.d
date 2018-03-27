string input;
  auto opts = getopt(
    args,
    "input|i", "Input captcha to process", &input
  );

  if (opts.helpWanted) {
    defaultGetoptPrinter("Day 1 of AoC", opts.options);
  }
