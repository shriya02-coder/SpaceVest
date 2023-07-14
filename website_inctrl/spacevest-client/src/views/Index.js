/*eslint-disable*/
import React from "react";
import IndexNavbar from "components/Navbars/IndexNavbar.js";
import image from "assets/img/banner-bg.png"

export default function Index() {
  return (
    <>
      <IndexNavbar fixed />
      <section className="flex justify-content-center h-screen min-h-860-px max-h-860-px" style={{
      backgroundImage: `url(${image})`,
      backgroundRepeat: 'no-repeat',
      backgroundSize: 'cover'
   }}>
        <div className="container mx-auto items-center flex flex-wrap">
          <div className="w-full md:w-8/12 lg:w-6/12 xl:w-6/12 px-4">
            <div className="pt-32 sm:pt-0">
              <h2 className="font-bold text-5xl text-white">
                SpaceVest- Your Sustainable Investments
              </h2>
              <p className="mt-4 text-lg leading-relaxed text-white">
                SpaceVest is a sustainable investement platform which helps individuals make informed and enviornment friendly decisions and investments
              </p>
              <div className="mt-12">
                <a href="auth/Login.js"
                  className="get-started text-white font-bold px-6 py-4 rounded outline-none focus:outline-none mr-1 mb-1 bg-teal-500 active:bg-teal-500 uppercase text-sm shadow hover:shadow-lg ease-linear transition-all duration-150"
                >
                  
                  Get started
                </a>
              </div>
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
