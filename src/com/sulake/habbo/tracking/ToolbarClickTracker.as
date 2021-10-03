package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1325:IHabboTracking;
      
      private var var_1979:Boolean = false;
      
      private var var_2798:int = 0;
      
      private var var_2009:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1325 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1325 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1979 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2798 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1979)
         {
            return;
         }
         ++this.var_2009;
         if(this.var_2009 <= this.var_2798)
         {
            this.var_1325.track("toolbar",param1);
         }
      }
   }
}
