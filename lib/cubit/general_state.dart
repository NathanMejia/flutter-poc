part of 'general_cubit.dart';

abstract class ActorState {
  ActorModel? actorModel;
}
class InitialActorState extends ActorState{}
class LoadingActorState extends ActorState{}
class ErrorActorState   extends ActorState{}

class ReadyActorState implements ActorState{
  @override
  ActorModel? actorModel;

  ReadyActorState(this.actorModel);

}
