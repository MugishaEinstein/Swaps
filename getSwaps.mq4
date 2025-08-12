//+------------------------------------------------------------------+
//| Script: mql4_get_swaps.mq4                                       |
//| Purpose: Iterate through available symbols and export their      |
//|          swap long/short values to a CSV file and the Experts log|
//| Author: ChatGPT (helper)                                         |
//+------------------------------------------------------------------+

#property copyright "ChatGPT"
#property version   "1.00"

// Runs once when the script is executed
void OnStart()
{
   int total = SymbolsTotal(true); // true => symbols in MarketWatch + all available
   string filename = "swaps.csv"; // file will be created in MQL4/Files

   // Open CSV for writing (overwrite if exists)
   int fileHandle = FileOpen(filename, FILE_CSV | FILE_WRITE, ',');
   if(fileHandle == INVALID_HANDLE)
   {
      Print("Failed to open file '", filename, "' in Files folder. GetLastError=", GetLastError());
      return;
   }

   // Header
   FileWrite(fileHandle, "Symbol", "SwapLong", "SwapShort");

   // Loop over symbols
   for(int i = 0; i < total; i++)
   {
      string sym = SymbolName(i, true);

      // Some symbols may not return valid info depending on broker settings
      double swapLong = MarketInfo(sym, MODE_SWAPLONG);
      double swapShort = MarketInfo(sym, MODE_SWAPSHORT);

      // Print to Experts log for quick view
      PrintFormat("%s  |  SwapLong=%s  |  SwapShort=%s", sym, DoubleToString(swapLong,10), DoubleToString(swapShort,10));

      // Write to CSV
      FileWrite(fileHandle, sym, DoubleToString(swapLong,10), DoubleToString(swapShort,10));
   }

   FileClose(fileHandle);

   // Notify user
   Alert("Swaps exported to Files\\", filename);
   Comment("Export complete. File: ", filename, " (MQL4/Files)");
}

//+------------------------------------------------------------------+
