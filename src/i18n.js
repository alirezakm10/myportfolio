import i18n from 'i18next'
import { initReactI18next } from 'react-i18next'
import LanguageDetector from 'i18next-browser-languagedetector'
import en from '../public/locales/en/en.json';
import fa from '../public/locales/fa/fa.json';

i18n.use(LanguageDetector).use(initReactI18next).init({
    resources: {
        en: {
            translation :{...en}
        },
        fa: {
            translation :{...fa}
        }

    },
    lng: 'en',
    fallbacking: 'en',
    interpolation: {
        escapeValue: true
    }
})


export default i18n;