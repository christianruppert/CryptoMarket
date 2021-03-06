/*   Copyright 2018 Sergei Munovarov
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

using Toybox.Application;
using Toybox.Communications as Comms;
using Toybox.WatchUi as Ui;
using Toybox.System as Sys;

class CryptoMarketApp extends Application.AppBase {

    hidden var currencyId;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        currencyId = getProperty("Market");
        loadTickers(Lang.format(URL, [CURRENCIES[currencyId]]));
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
        Comms.cancelAllRequests();
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new MarketView(null, null, null, false) ];
    }

    function loadTickers(url) {
        var options = {
            :method => Comms.HTTP_REQUEST_METHOD_GET,
            :responseType => Comms.HTTP_RESPONSE_CONTENT_TYPE_JSON
        };

        Comms.makeJsonRequest(url, null, options, method(:onReceive));
    }

    function onReceive(responseCode, data) {
        if (data != null) {
            var tickers = data["data"];
            var initialView = new MarketView(tickers[0], 1, tickers.size(), false);
            Ui.switchToView(
                initialView,
                new InputDelegate(tickers, initialView),
                Ui.SLIDE_IMMEDIATE
            );
        } else {
            Ui.switchToView(new EmptyView(), null, Ui.SLIDE_IMMEDIATE);
        }
    }
}

const CURRENCIES = ["USD", "EUR", "BTC"];
const URL = "https://cex.io/api/tickers/$1$";