import all from 'cloudinary'
const initGallery = () => {


const myGallery = cloudinary.galleryWidget({
  container: "#my-gallery",
  cloudName: "sophieshadilejeune",
  mediaAssets: [{ tag: "test" }]    // by default mediaType: "image"
});
};

myGallery.render();

export { initGallery };
