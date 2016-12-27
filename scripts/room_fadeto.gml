///room_fadeto(room)
// Create a room fading helper to transition to the given room.
{
  with (instance_create(0, 0, obj_room_fadeto)) {
    _room = argument0;
  }
}
