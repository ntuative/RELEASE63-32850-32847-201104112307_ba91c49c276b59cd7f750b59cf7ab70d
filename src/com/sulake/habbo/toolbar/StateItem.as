package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var _id:String;
      
      private var var_1391:Boolean;
      
      private var var_2699:Boolean;
      
      private var var_208:int = 120;
      
      private var var_1950:String;
      
      private var var_1494:String = "-1";
      
      private var var_1611:String = "-1";
      
      private var var_1949:String = "-1";
      
      private var var_2700:String;
      
      private var var_473:String;
      
      private var _frames:XMLList;
      
      private var var_368:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         this._id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            this.var_1391 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            this.var_2699 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            this.var_208 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            this.var_1950 = param1.@namebase;
         }
         else
         {
            this.var_1950 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            this.var_1494 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            this.var_1611 = param1.@nextState;
         }
         else
         {
            this.var_1611 = this._id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            this.var_1949 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            this.var_2700 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            this.var_473 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            this._frames = _loc3_;
         }
         if(param1.attribute("label").length() > 0)
         {
            this.var_368 = param1.@label;
         }
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get loop() : Boolean
      {
         return this.var_1391;
      }
      
      public function get bounce() : Boolean
      {
         return this.var_2699;
      }
      
      public function get timer() : int
      {
         return this.var_208;
      }
      
      public function get nameBase() : String
      {
         return this.var_1950;
      }
      
      public function get hasStateOver() : Boolean
      {
         return this.var_1494 != "-1";
      }
      
      public function get stateOver() : String
      {
         return this.var_1494;
      }
      
      public function get nextState() : String
      {
         return this.var_1611;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return this.var_1949 != "-1";
      }
      
      public function get method_13() : String
      {
         return this.var_1949;
      }
      
      public function get tooltip() : String
      {
         return this.var_2700;
      }
      
      public function get frames() : XMLList
      {
         return this._frames;
      }
      
      public function get background() : String
      {
         return this.var_473;
      }
      
      public function get label() : String
      {
         return this.var_368;
      }
   }
}
