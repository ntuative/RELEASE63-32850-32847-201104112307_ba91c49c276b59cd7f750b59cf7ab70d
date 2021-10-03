package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_927:Array;
      
      private var var_2309:String;
      
      private var var_2308:String;
      
      private var var_2310:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         this.var_927 = param1;
         this.var_2309 = param2;
         this.var_2308 = param3;
         this.var_2310 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_927;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2309;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2308;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2310;
      }
   }
}
