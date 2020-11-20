import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Looking for a freelancer?", "Explore our services!"],
    typeSpeed: 70,
    loop: false
  });
}

export { loadDynamicBannerText };
