package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_145:String = "RSPE_VOTE_QUESTION";
      
      public static const const_134:String = "RSPE_VOTE_RESULT";
       
      
      private var var_1165:String = "";
      
      private var var_1348:Array;
      
      private var var_1279:Array;
      
      private var var_1642:int = 0;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1348 = [];
         this.var_1279 = [];
         super(param1,param2,param7,param8);
         this.var_1165 = param3;
         this.var_1348 = param4;
         this.var_1279 = param5;
         if(this.var_1279 == null)
         {
            this.var_1279 = [];
         }
         this.var_1642 = param6;
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
