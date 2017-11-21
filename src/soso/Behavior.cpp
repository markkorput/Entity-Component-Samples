#include "Behavior.h"

using namespace soso;

void BehaviorBase::remove()
{
  removeBehavior(entity(), this);
  _entity.invalidate();
}
