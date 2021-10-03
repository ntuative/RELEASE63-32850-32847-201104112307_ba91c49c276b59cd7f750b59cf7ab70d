package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1985:int;
      
      private var var_2760:int;
      
      private var var_731:int;
      
      private var var_552:Number;
      
      private var var_2761:Boolean;
      
      private var var_2759:int;
      
      private var var_1986:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_552);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2760 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2759 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2761 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_731;
         if(this.var_731 == 1)
         {
            this.var_552 = param1;
            this.var_1985 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_731);
            this.var_552 = this.var_552 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2761 && param3 - this.var_1985 >= this.var_2760)
         {
            this.var_731 = 0;
            if(this.var_1986 < this.var_2759)
            {
               param2.track("performance","averageFramerate",this.frameRate);
               ++this.var_1986;
               this.var_1985 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
