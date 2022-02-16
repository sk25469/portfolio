String kbToMB(int kb) {
  int mbInt = kb ~/ 1024;
  if (mbInt > 0) {
    return mbInt.toString() + " MB";
  } else {
    return kb.toString() + " KB";
  }
}
