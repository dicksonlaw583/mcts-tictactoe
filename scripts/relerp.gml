///relerp(oldmin, oldmax, value, newmin, newmax)
// Re-interpolates the given value in the context of the new range [<newmin>, <newmax>]
// Example: fahrenheit = relerp(0, 100, celcius, 32, 212);
{
  return (argument2-argument0)/(argument1-argument0)*(argument4-argument3)+argument3;
}
