package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_2587:String;
      
      private var var_2589:int;
      
      private var var_2588:int;
      
      private var var_1904:int;
      
      private var _id:int;
      
      private var var_2584:Boolean;
      
      private var _type:String;
      
      private var var_1869:String;
      
      private var var_1868:int;
      
      private var var_2586:String;
      
      private var var_2590:int;
      
      private var var_2585:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2587 = param1.readString();
         this.var_2589 = param1.readInteger();
         this.var_2588 = param1.readInteger();
         this.var_1904 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_2584 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1869 = param1.readString();
         this.var_1868 = param1.readInteger();
         this.var_2586 = param1.readString();
         this.var_2590 = param1.readInteger();
         this.var_2585 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1869 = "";
         this.var_1868 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_2587;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2589;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2588;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1904;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_2584;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1869;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1868;
      }
      
      public function get localizationCode() : String
      {
         return this.var_2586;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2590;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2585;
      }
   }
}
