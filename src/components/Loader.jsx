import { Html } from "@react-three/drei";
import {PacmanLoader } from 'react-spinners'

const Loader = () => {
  return (
      <div className='flex justify-center items-center w-full h-screen z-2'>
      <PacmanLoader  color="#2b77e7" size={90} />
      </div>
  );
};

export default Loader;
