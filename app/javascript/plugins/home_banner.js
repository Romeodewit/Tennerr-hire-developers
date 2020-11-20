import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find the perfect web app development services", "Explore our services"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
