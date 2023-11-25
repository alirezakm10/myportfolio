import { Route, BrowserRouter as Router, Routes } from "react-router-dom";
import i18n from "./i18n";
import { Footer, Navbar } from "./components";
import { About, Contact, Home, Projects } from "./pages";
import { I18nextProvider } from "react-i18next";



const App = () => {

  return (
    <I18nextProvider i18n={i18n}>
    <main className='bg-slate-300/20'>
      <Router>
        <Navbar />
        <Routes>
          <Route path='/' element={<Home />} />
          <Route
            path='/*'
            element={
              <>
                <Routes>
                  <Route path='/about' element={<About />} />
                  <Route path='/projects' element={<Projects />} />
                  <Route path='/contact' element={<Contact />} />
                </Routes>
                <Footer />
              </>
            }
          />
        </Routes>
      </Router>
    </main>
    </I18nextProvider>
  );
};

export default App;
