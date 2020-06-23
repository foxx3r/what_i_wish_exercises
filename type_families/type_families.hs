-- Unassociated form
type family Rep a
type instance Rep Int = Char
type instance Rep Char = Int

class Convertible a where
    convert :: a -> Rep a

instance Convertible Int where
    convert = chr

instance Convertible Char where
    convert = ord

-- Associated form
class Convertible a where
    type Rep a
    convert :: a -> Rep a

instance Convertible Int where
    type Rep Int = Char
    convert = chr

instance Convertible Char where
    type Rep Char = Int
    convert = ord
