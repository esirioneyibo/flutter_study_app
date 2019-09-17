class ImageUtil {
  static const IMAGE_END = [
    ".png",
    ".jpg",
    ".jpeg",
    ".gif",
    ".svg"
  ];

  static isImageEnd(path) {
    bool image = false;
    for (String item in IMAGE_END) {
      if (path.indexOf(item) + item.length == path.length) {
        image = true;
      }
    }
    return image;
  }
}