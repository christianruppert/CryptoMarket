/*   Copyright 2019 Sergei Munovarov
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

module Format {

    const formats = {
        "BTC:USD" => "%.01f",
        "ETH:USD" => "%.02f",
        "BCH:USD" => "%.02f",
        "BTG:USD" => "%.02f",
        "DASH:USD" => "%.02f",
        "LTC:USD" => "%.02f",
        "XRP:USD" => "%.04f",
        "XLM:USD" => "%.04f",
        "ZEC:USD" => "%.02f",
        "MHC:USD" => "%.04f",
        "OMG:USD" => "%.04f",
        "TRX:USD" => "%.04f",
        "ADA:USD" => "%.04f",
        "BTT:USD" => "%.06f",
        "GUSD:USD" => "%.04f",
        "USDC:USD" => "%.04f",
        "BTC:EUR" => "%.01f",
        "ETH:EUR" => "%.02f",
        "BCH:EUR" => "%.02f",
        "BTG:EUR" => "%.02f",
        "DASH:EUR" => "%.02f",
        "LTC:EUR" => "%.02f",
        "XRP:EUR" => "%.04f",
        "XLM:EUR" => "%.04f",
        "ZEC:EUR" => "%.02f",
        "MHC:EUR" => "%.04f",
        "OMG:EUR" => "%.04f",
        "TRX:EUR" => "%.04f",
        "ADA:EUR" => "%.04f",
        "BTT:EUR" => "%.06f",
        "GUSD:EUR" => "%.04f",
        "ETH:BTC" => "%.06f",
        "BCH:BTC" => "%.06f",
        "BTG:BTC" => "%.06f",
        "DASH:BTC" => "%.06f",
        "LTC:BTC" => "%.08f",
        "XRP:BTC" => "%.06f",
        "XLM:BTC" => "%.08f",
        "ZEC:BTC" => "%.06f",
        "MHC:BTC" => "%.08f",
        "TRX:BTC" => "%.08f",
        "BTT:BTC" => "%.08f",
        "OMG:BTC" => "%.08f",
        "ONT:USD" => "%.04f",
        "ONG:USD" => "%.04f",
        "ONT:EUR" => "%.04f",
        "ONG:EUR" => "%.04f",
        "ONT:BTC" => "%.08f",
        "ONG:BTC" => "%.08f"
    };

    function formatPrice(amount, pair) {
        if (amount instanceof Toybox.Lang.String) {
            amount = amount.toFloat();
        }

        var precision = formats[pair];

        return (precision == null) ? amount.format("%.02f") : amount.format(precision);
    }
}