import { NavLink } from "react-router-dom";
import { FaHouseChimney } from "react-icons/fa6";
// import { logo } from "../assets/images";
import { useTranslation } from "react-i18next";
import DropDown from "./DropDown";


const Navbar = () => {
  const { t, i18n } = useTranslation();

  const lngs = {
    en: { nativeName: t('lng.english') },
    fa: { nativeName: t('lng.persian') }
  };
  
  const handleChangeLanguage = (lng) => {
  i18n.changeLanguage(lng)
  }

  return (
    <header className='header'>
      <NavLink to='/'>
        <div className="flex justify-center items-center rounded-lg w-10 h-10 transition neo-brutalism-blue hover:bg-blue-300" >
      <FaHouseChimney  size='30px' color="white" stroke="#000" />
        </div>
      </NavLink>

      <DropDown label={t('lng')} data={lngs} setter={handleChangeLanguage} />




      <div>
          {Object.keys(lngs).map((lng) => (
            <button key={lng} style={{ fontWeight: i18n.resolvedLanguage === lng ? 'bold' : 'normal' }} type="submit" onClick={() => i18n.changeLanguage(lng)}>
              {lngs[lng].nativeName}
            </button>
          ))}
        </div>
      <nav className='flex text-lg gap-7 font-medium'>
        <NavLink to='/about' className={({ isActive }) => isActive ? "text-blue-600" : "text-black" }>
          {t("nav.about")}
        </NavLink>
        <NavLink to='/projects' className={({ isActive }) => isActive ? "text-blue-600" : "text-black"}>
        {t("nav.projects")}
        </NavLink>
      </nav>
    </header>
  );
};

export default Navbar;
