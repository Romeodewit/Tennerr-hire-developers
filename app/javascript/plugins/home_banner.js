import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Need an online presence?", "Explore our services!"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
