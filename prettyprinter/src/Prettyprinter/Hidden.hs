-- | A newtype wrapper for hiding values in prettyprinted output.
module Prettyprinter.Hidden (Hidden (..)) where

import Prettyprinter.Internal (emptyDoc, Pretty (pretty))

-- | Wrap a value with 'Hidden' to exclude it from prettyprinted output.
--
-- The type of the wrapped value does not require a `Pretty` instance.
newtype Hidden a = Hidden a deriving (Eq, Read, Show)

-- | >>> pretty (Hidden ())
-- <BLANKLINE>
--
-- The argument is not used:
--
-- >>> pretty (error "Strict?" :: Hidden ())
-- <BLANKLINE>
instance Pretty (Hidden a) where
  pretty _ = emptyDoc
