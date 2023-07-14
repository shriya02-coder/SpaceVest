import React from "react";
import { Link } from "react-router-dom";
import scale from "../../assets/img/scale.jpg"
import book from "../../assets/img/book.jpg"
import greeninv from "../../assets/img/ge.jpg"
import soc from "../../assets/img/mf.jpg"
import greensus from "../../assets/img/sip.jpg"

export default function Landing() {
  return (
    <>
      <main>
       

        <section className="relative py-20">

          <div className="container mx-auto px-4">
            <div className="items-center flex flex-wrap">
              <div className="w-full md:w-4/12 ml-auto mr-auto px-4">
                <img
                  alt="..."
                  className="max-w-full rounded-lg shadow-lg"
                  src="https://cdn.corporatefinanceinstitute.com/assets/esg-score-1.jpg"
                  width="900px"
                  height="900px"
                />
                <br></br>
                <br></br>
                <img
                  alt="..."
                  className="max-w-full rounded-lg shadow-lg"
                  src={scale}
                  width="900px"
                  height="900px"
                />
              </div>
              <div className="w-full md:w-5/12 ml-auto mr-auto px-4">
                <div className="md:pr-12">
                  {/* <div className="text-lightBlue-600 p-3 text-center inline-flex items-center justify-center w-16 h-16 mb-6 shadow-lg rounded-full bg-lightBlue-300">
                    <i className="fas fa-rocket text-xl"></i>
                  </div> */}
                  <h1 className="text-5xl text-white font-semibold">ESG Risk Ratings</h1>
                  <p className="mt-4 text-lg leading-relaxed text-white">
                  Environmental, social and governance (ESG) is a framework used to assess an organization's business practices and performance on various sustainability and ethical issues. It also provides a way to measure business risks and opportunities in those areas. ESG Risk Ratings measure a company's exposure to
industry-specific material ESG risks and how well a company is
managing those risks. This multi-dimensional way of measuring
ESG risk combines the concepts of management and exposure to
arrive at an absolute assessment of ESG risk. We identify five
categories of ESG risk severity that could impact a company's
enterprise value
                  </p>
                  
                </div>
              </div>
            </div>
          </div>
        </section>

        <section className="pt-20 pb-48">
          <div className="container mx-auto px-4">
            <div className="flex flex-wrap justify-center text-center mb-24">
              <div className="w-full lg:w-6/12 px-4">
                <h2 className="text-4xl text-white font-semibold">Here is a Beginner's guide to Sustainable Investing</h2>
                <p className="text-lg leading-relaxed m-4 text-blueGray-500">
                Sustainable Investing is the practice of analysing a company's environmental, social and governance (ESG) risks, as well as assessing its opportunities and progress, using ESG data and fundamental insights, to inform the allocation of capital.
                </p>
              </div>
            </div>
            <div className="flex flex-wrap">
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4">
                <div className="px-6">
                  <img
                    alt="..."
                    src={book}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <h5 className="text-xl text-white font-bold">Social Investing</h5>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4">
                <div className="px-6">
                  <img
                    alt="..."
                    src={greeninv}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <h5 className="text-xl text-white font-bold">Green Investments</h5>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4">
                <div className="px-6">
                  <img
                    alt="..."
                    src={soc}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <h5 className="text-xl text-white font-bold">ESG Investing</h5>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              <div className="w-full md:w-6/12 lg:w-3/12 lg:mb-0 mb-12 px-4">
                <div className="px-6">
                  <img
                    alt="..."
                    src={greensus}
                    className="shadow-lg rounded-full mx-auto max-w-120-px"
                  />
                  <div className="pt-6 text-center">
                    <h5 className="text-xl text-white font-bold">Sustainable Real Estate</h5>
                    
                    <div className="mt-6">
                  
                    </div>
                  </div>
                </div>
              </div>
              
              
              
            </div>
          </div>
        </section>

      
        
      </main>
    </>
  );
}
