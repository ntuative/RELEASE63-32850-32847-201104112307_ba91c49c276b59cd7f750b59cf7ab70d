package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2950:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_83 = param1.desktop;
         var_64 = param1.var_1303 as WindowController;
         var_173 = param1.var_1306 as WindowController;
         var_147 = param1.renderer;
         var_867 = param1.var_1307;
         param2.begin();
         param2.end();
         param1.desktop = var_83;
         param1.var_1303 = var_64;
         param1.var_1306 = var_173;
         param1.renderer = var_147;
         param1.var_1307 = var_867;
      }
   }
}
