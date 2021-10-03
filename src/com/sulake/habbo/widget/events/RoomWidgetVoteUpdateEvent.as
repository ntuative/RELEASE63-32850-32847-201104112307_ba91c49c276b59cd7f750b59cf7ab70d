package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_145:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_134:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1165:String;
      
      private var var_1348:Array;
      
      private var var_1279:Array;
      
      private var var_1642:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1165 = param2;
         this.var_1348 = param3;
         this.var_1279 = param4;
         if(this.var_1279 == null)
         {
            this.var_1279 = [];
         }
         this.var_1642 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1165;
      }
      
      public function get choices() : Array
      {
         return this.var_1348.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1279.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1642;
      }
   }
}
