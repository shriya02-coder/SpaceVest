import React from "react";
import stocks from "../../../assets/img/stocks.jpg"
import mars from "../../../assets/img/mars.jpeg"
import merc from "../../../assets/img/mercury.jpeg"
import asteroid from "../../../assets/img/asteroid.jpeg"
import venus from "../../../assets/img/venus.jpeg"
import jupiter from "../../../assets/img/Jupiter.jpg"
import nft from "../../../assets/img/nft.jpeg"
import moon from "../../../assets/img/moon.jpeg"

export default function Spacevest() {
    return (
        <>
            <div className="flex flex-wrap pt-12 pb-32">
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={mars}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Mars Real Esatate</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={merc}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Mercury Real Estate</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={jupiter}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Jupiter Moon Estate</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={venus}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Venus Real Estate</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>

              {/* ------------------ */}
              
              
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={nft}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Space NFTs</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={moon}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Moon Real Estate</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={stocks}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Stocks on Mars</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4 pt-12">
                <div className="px-6">
                  <img
                    alt="..."
                    src={asteroid}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <button className="text-xl text-white font-bold">Asteriod Mining</button>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              
            </div>
        </>
    );
}
