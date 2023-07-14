import React from "react";
import "./Sidebar.css"
import image1 from "assets/img/mf.jpg"
import image2 from "assets/img/crypto.jpg"
import image3 from "assets/img/gb.jpg"
import image4 from "assets/img/sip.jpg"
import image5 from "assets/img/Forex.jpg"
import image6 from "assets/img/ge.jpg"
import image7 from "assets/img/stocks.jpg"

export default function Sidebar() {
  const [collapseShow, setCollapseShow] = React.useState("hidden");
  return (
    <>
      <nav className="md:left-0 md:block md:bottom-0 md:overflow-y-auto md:flex-row md:flex-nowrap md:overflow-hidden shadow-xl flex flex-wrap items-center justify-between relative md:w-64 z-10 py-4 px-6">
        <div className="md:flex-col md:items-stretch md:min-h-full md:flex-nowrap px-0 flex flex-wrap items-center justify-between w-full mx-auto">
          {/* Toggler */}
          <button
            className="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
            type="button"
            onClick={() => setCollapseShow(" m-2 py-3 px-6")}
          >
            <i className="fas fa-bars"></i>
          </button>
          {/* Collapse */}
          <div
            className={
              "md:flex md:flex-col md:items-stretch md:opacity-100 md:relative md:mt-4 md:shadow-none shadow absolute top-0 left-0 right-0 z-40 overflow-y-auto overflow-x-hidden h-auto items-center flex-1 rounded " +
              collapseShow
            }
          >
            {/* Collapse header */}
            <div className="md:min-w-full md:hidden block pb-4 mb-4 border-b border-solid border-blueGray-200">
              <div className="flex flex-wrap">
                <div className="w-6/12 flex justify-end">
                  <button
                    type="button"
                    className="cursor-pointer text-black opacity-50 md:hidden px-3 py-1 text-xl leading-none bg-transparent rounded border border-solid border-transparent"
                    onClick={() => setCollapseShow("hidden")}
                  >
                    <i className="fa fa-times"></i>
                  </button>
                </div>
              </div>
            </div>
            {/* Form */}
            <form className="mt-6 mb-4 md:hidden">
              <div className="mb-3 pt-0">
                <input
                  type="text"
                  placeholder="Search"
                  className="border-0 px-3 py-2 h-12 border-solid  border-blueGray-500 placeholder-blueGray-300 text-blueGray-600  rounded text-base leading-snug shadow-none outline-none focus:outline-none w-full font-normal"
                />
              </div>
            </form>
            <hr className="my-4 md:min-w-full" />
            {/* Filter */}
              <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image1})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Mutual Funds</div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image2})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Cryptocurrency</div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image3})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Green Bonds</div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image4})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>SIP</div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image5})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Forex
                  </div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image6})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Green Energy
                  </div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
               {/* Filter */}
               <div class="backdrop w-full md:w-1/4  bg-opacity-10 rounded p-3 text-white border border-gray-300 shadow-lg">
                <div className="flex justify-content-center h-20" style={{
                  backgroundImage: `url(${image7})`,
                  backgroundRepeat: 'no-repeat',
                  backgroundSize: 'cover'
                }}>
                  <div>Stocks
                  </div>
                </div>
              </div>
              <hr className="my-4 md:min-w-full" />
            </div>
          </div>
      </nav>
    </>
  );
}
