// include the exif-js library

// Function to read EXIF data from an image
function readExifData(imageFile) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = function (e) {
      const exifData = EXIF.readFromBinaryFile(e.target.result);
      resolve(exifData);
    };
    reader.onerror = function (e) {
      reject(e);
    };
    reader.readAsArrayBuffer(imageFile);
  });
}

// Usage example
const imageFile = document.getElementById('imageInput').files[0];
readExifData(imageFile)
  .then((exifData) => {
    console.log(exifData);
    // Do something with the EXIF data
  })
  .catch((error) => {
    console.error(error);
  });
