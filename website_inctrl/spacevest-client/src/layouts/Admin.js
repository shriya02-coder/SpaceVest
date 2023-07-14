import React from "react";
import { Switch, Route, Redirect } from "react-router-dom";

// components

import Navbar from "components/Navbars/IndexNavbar.js";
// import HeaderStats from "components/Headers/HeaderStats.js";
import image from "assets/img/banner-bg.png"
// views

import Dashboard from "views/admin/Dashboard.js";
// import Settings from "views/admin/Settings.js";
import Tables from "views/admin/Tables.js";
import Landing from "views/admin/Landing.js";
import Spacevest from "views/admin/spacevest/Spacevest";

export default function Admin() {
  return (
    <>
      <div className="relative md:pt-32 pb-32 pt-12" style={{
      backgroundImage: `url(${image})`,
      backgroundRepeat: 'no-repeat',
      backgroundSize: 'cover'
   }}>
        <Navbar />
        <div className="px-4 pt-20 md:px-10 mx-auto w-full -m-24">

          <Switch>
            <Route path="/admin/dashboard" exact component={Dashboard} />
            {/* <Route path="/admin/settings" exact component={Settings} /> */}
            <Route path="/admin/tables" exact component={Tables} />
            <Route path="/admin/landing" exact component={Landing} />
            <Route path="/admin/spacevest" exact component={Spacevest}/>
            <Redirect from="/admin" to="/admin/dashboard" />
          </Switch>
        </div>
      </div>
    </>
  );
}
