# mql4_get_swaps.mq4 – Swap Rate Export Script

## Overview
This MQL4 script retrieves **Swap Long** and **Swap Short** values for all available symbols in your broker’s server list and exports the data to a CSV file. It also prints the results to the Experts log for quick inspection.

## Features
- Iterates over all symbols available in the Market Watch list.
- Retrieves swap long and swap short values using `MarketInfo()`.
- Outputs a `swaps.csv` file to the `MQL4/Files` folder.
- Displays swap data in the Experts log.
- Alerts and on-chart comment when export completes.

## Installation
1. Save the `mql4_get_swaps.mq4` file into your **`MQL4/Scripts`** folder inside your MetaTrader 4 data directory.
2. Open **MetaEditor** and compile the script.
3. Restart MetaTrader 4 (optional, but recommended) or refresh the Scripts folder in the Navigator panel.

## Usage
1. Open MetaTrader 4.
2. Drag and drop the script from the Navigator → Scripts list onto any chart.
3. The script will run once and:
   - Print swap values to the Experts log.
   - Save the `swaps.csv` file to the `MQL4/Files` directory.
4. Open the CSV file with Excel or any text editor to view results.

## Notes
- Swap values depend on your broker and may be expressed in points, pips, or account currency per lot.
- Brokers can change swap rates daily, especially on rollover days (often Wednesday triple swaps).
- If a symbol does not return valid swap values, it might be restricted or disabled by your broker.

## Troubleshooting
- **File not found**: Ensure the script has write permissions and you are checking the correct `MQL4/Files` folder.
- **Invalid swap values**: Check if the symbol is enabled in Market Watch and tradable.

## License
This script is provided as-is for personal or educational use. Use at your own risk.

---
**Tip:** You can extend this script to run automatically each day to log swap history for analysis.
