ps-pkgs:
  let
    fetchGitSubdir = opts: dir: (builtins.fetchGit opts) + "/" + dir;
  in
  with ps-pkgs;
  { array-search =
  { 
    src.git.repo = "https://github.com/joellefkowitz/array-search.git";
    src.git.rev = "21347a33226b6667e2c91e1658e3bd611270f14d";
    
      
      
    info =
      { version = "0.5.6";
        dependencies =
          [ arrays effect foldable-traversable maybe prelude 
          ];
      };
  };
arraybuffer-types =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-arraybuffer-types.git";
    src.git.rev = "9b0b7a0f9ee034e039f3d3a2a9c3f74eb7c9264a";
    
      
      
    info =
      { version = "3.0.2";
        dependencies =
          [ 
          ];
      };
  };
arrays =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-arrays";
    info =
      { 
        dependencies =
          [ bifunctors control foldable-traversable maybe nonempty partial prelude st tuples unfoldable unsafe-coerce 
          ];
      };
  };
ask =
  { 
    src.git.repo = "https://github.com/Mateiadrielrafael/purescript-ask.git";
    src.git.rev = "536e8f5855222c580d198f9742e6de012bd1a4c7";
    
      
      
    info =
      { version = "1.0.0";
        dependencies =
          [ unsafe-coerce 
          ];
      };
  };
"assert" =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-assert";
    info =
      { 
        dependencies =
          [ prelude 
          ];
      };
  };
assert-multiple =
  { 
    src.git.repo = "https://github.com/joellefkowitz/assert-multiple.git";
    src.git.rev = "cbe5759e56c12b772db392aed90c405ad6d5d8f3";
    
      
      
    info =
      { version = "0.3.4";
        dependencies =
          [ effect foldable-traversable prelude 
          ];
      };
  };
bifunctors =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-bifunctors";
    info =
      { 
        dependencies =
          [ const either newtype prelude tuples 
          ];
      };
  };
call-by-name =
  { 
    src.git.repo = "https://github.com/natefaubion/purescript-call-by-name.git";
    src.git.rev = "1f4a7ca0ef1cda0067bafdf5ca30f22619e3634f";
    
      
      
    info =
      { version = "4.0.1";
        dependencies =
          [ control either lazy maybe unsafe-coerce 
          ];
      };
  };
codec =
  { 
    src.git.repo = "https://github.com/garyb/purescript-codec.git";
    src.git.rev = "0e427b4665d2a6b1b34f97df1fa1dd65ebada16f";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ bifunctors profunctor 
          ];
      };
  };
const =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-const";
    info =
      { 
        dependencies =
          [ invariant newtype prelude 
          ];
      };
  };
contravariant =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-contravariant";
    info =
      { 
        dependencies =
          [ const either newtype prelude tuples 
          ];
      };
  };
control =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-control";
    info =
      { 
        dependencies =
          [ newtype prelude 
          ];
      };
  };
debug =
  { 
    src.git.repo = "https://github.com/garyb/purescript-debug.git";
    src.git.rev = "a37b82f62c89734934c0962ece3412913020460a";
    
      
      
    info =
      { version = "6.0.2";
        dependencies =
          [ functions prelude 
          ];
      };
  };
decimals =
  { 
    src.git.repo = "https://github.com/sharkdp/purescript-decimals.git";
    src.git.rev = "1347856b26ba194f8ee7682a038c4e95c971e064";
    
      
      
    info =
      { version = "7.1.0";
        dependencies =
          [ maybe 
          ];
      };
  };
distributive =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-distributive";
    info =
      { 
        dependencies =
          [ identity newtype prelude tuples type-equality 
          ];
      };
  };
effect =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-effect";
    info =
      { 
        dependencies =
          [ prelude 
          ];
      };
  };
either =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-either";
    info =
      { 
        dependencies =
          [ control invariant maybe prelude 
          ];
      };
  };
enums =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-enums";
    info =
      { 
        dependencies =
          [ control either maybe newtype nonempty partial prelude tuples unfoldable 
          ];
      };
  };
env-names =
  { 
    src.git.repo = "https://github.com/joellefkowitz/env-names.git";
    src.git.rev = "0c591c8f7a205ddb31400ec45a4c67ce99e3f4ea";
    
      
      
    info =
      { version = "0.3.4";
        dependencies =
          [ arrays maybe prelude 
          ];
      };
  };
exists =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-exists";
    info =
      { 
        dependencies =
          [ unsafe-coerce 
          ];
      };
  };
expect-inferred =
  { 
    src.git.repo = "https://github.com/justinwoo/purescript-expect-inferred.git";
    src.git.rev = "f43fda03d49647e6c598fceee684168a76cc76eb";
    
      
      
    info =
      { version = "3.0.0";
        dependencies =
          [ prelude typelevel-prelude 
          ];
      };
  };
foldable-traversable =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-foldable-traversable";
    info =
      { 
        dependencies =
          [ bifunctors const control either functors identity maybe newtype orders prelude tuples 
          ];
      };
  };
foreign =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-foreign";
    info =
      { 
        dependencies =
          [ prelude 
          ];
      };
  };
freer-free =
  { 
    src.git.repo = "https://github.com/mikesol/purescript-freer-free.git";
    src.git.rev = "e6e82b55f320bf96a0d04f04efcb74d092222f76";
    
      
      
    info =
      { version = "0.0.1";
        dependencies =
          [ prelude record 
          ];
      };
  };
functions =
  { 
    src.git.repo = "https://github.com/purescript/purescript-functions.git";
    src.git.rev = "f626f20580483977c5b27a01aac6471e28aff367";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ prelude 
          ];
      };
  };
functor1 =
  { 
    src.git.repo = "https://github.com/garyb/purescript-functor1.git";
    src.git.rev = "d71ab5f37bd44b3f08d8a9acb80018cd7c1a39ae";
    
      
      
    info =
      { version = "3.0.0";
        dependencies =
          [ newtype prelude 
          ];
      };
  };
functors =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-functors";
    info =
      { 
        dependencies =
          [ bifunctors const contravariant control distributive either invariant maybe newtype prelude profunctor tuples unsafe-coerce 
          ];
      };
  };
identity =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-identity";
    info =
      { 
        dependencies =
          [ control invariant newtype prelude 
          ];
      };
  };
indexed-monad =
  { 
    src.git.repo = "https://github.com/garyb/purescript-indexed-monad.git";
    src.git.rev = "cd4d506dc86c525bbb126b972fd3fc1b237bdec4";
    
      
      
    info =
      { version = "3.0.0";
        dependencies =
          [ control newtype 
          ];
      };
  };
integers =
  { 
    src.git.repo = "https://github.com/purescript/purescript-integers.git";
    src.git.rev = "54d712b25c594833083d15dc9ff2418eb9c52822";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ maybe numbers prelude 
          ];
      };
  };
interpolate =
  { 
    src.git.repo = "https://github.com/jordanmartinez/purescript-interpolate.git";
    src.git.rev = "e5994500999b9f194c1d8ec17854d3f61f3cb3eb";
    
      
      
    info =
      { version = "5.0.2";
        dependencies =
          [ partial prelude 
          ];
      };
  };
invariant =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-invariant";
    info =
      { 
        dependencies =
          [ control prelude 
          ];
      };
  };
js-timers =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-js-timers.git";
    src.git.rev = "7cb728b3e6dc29f355143617e6e9ac770ecd9273";
    
      
      
    info =
      { version = "6.1.0";
        dependencies =
          [ effect 
          ];
      };
  };
js-uri =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-js-uri.git";
    src.git.rev = "06f7ae755ccb36bfa80bc3702533165af5c7ef06";
    
      
      
    info =
      { version = "3.1.0";
        dependencies =
          [ functions maybe 
          ];
      };
  };
justifill =
  { 
    src.git.repo = "https://github.com/i-am-the-slime/purescript-justifill.git";
    src.git.rev = "c72e57594dfd22ebaa37db4169525cc001bc51c4";
    
      
      
    info =
      { version = "0.5.0";
        dependencies =
          [ maybe prelude record typelevel-prelude 
          ];
      };
  };
lazy =
  { 
    src.git.repo = "https://github.com/purescript/purescript-lazy.git";
    src.git.rev = "48347841226b27af5205a1a8ec71e27a93ce86fd";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ control foldable-traversable invariant prelude 
          ];
      };
  };
lcg =
  { 
    src.git.repo = "https://github.com/purescript/purescript-lcg.git";
    src.git.rev = "67c6c6483a563a59ae036d9dca0f1be2835326a5";
    
      
      
    info =
      { version = "4.0.0";
        dependencies =
          [ effect integers maybe partial prelude random 
          ];
      };
  };
leibniz =
  { 
    src.git.repo = "https://github.com/paf31/purescript-leibniz.git";
    src.git.rev = "0e723461d23bbe0e88cdc8f4a6bd0dfb992d95bf";
    
      
      
    info =
      { version = "5.0.0";
        dependencies =
          [ prelude unsafe-coerce 
          ];
      };
  };
linalg =
  { 
    src.git.repo = "https://github.com/gbagan/purescript-linalg.git";
    src.git.rev = "8dc62a79b62fd05a07f5f3ee77ce6f1211615487";
    
      
      
    info =
      { version = "5.1.0";
        dependencies =
          [ arrays foldable-traversable functions maybe prelude tuples 
          ];
      };
  };
literals =
  { 
    src.git.repo = "https://github.com/rowtype-yoga/purescript-literals.git";
    src.git.rev = "5a9dc8be19875e5d1f3b91e85880f5e326acbf65";
    
      
      
    info =
      { version = "1.0.2";
        dependencies =
          [ integers maybe numbers partial prelude typelevel-prelude unsafe-coerce 
          ];
      };
  };
maybe =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-maybe";
    info =
      { 
        dependencies =
          [ control invariant newtype prelude 
          ];
      };
  };
media-types =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-media-types.git";
    src.git.rev = "af853de226592f319a953637069a943dd261cba3";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ newtype prelude 
          ];
      };
  };
nested-functor =
  { 
    src.git.repo = "https://github.com/acple/purescript-nested-functor.git";
    src.git.rev = "f066b7933ff9b16ed3c281228e54bbe8519eed1e";
    
      
      
    info =
      { version = "0.2.1";
        dependencies =
          [ prelude type-equality 
          ];
      };
  };
newtype =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-newtype";
    info =
      { 
        dependencies =
          [ prelude safe-coerce 
          ];
      };
  };
node-buffer =
  { 
    src.git.repo = "https://github.com/purescript-node/purescript-node-buffer.git";
    src.git.rev = "7be7bd082b7d3e15de2ed5a626d43af746bdb35e";
    
      
      
    info =
      { version = "8.0.0";
        dependencies =
          [ arraybuffer-types effect maybe st unsafe-coerce 
          ];
      };
  };
node-path =
  { 
    src.git.repo = "https://github.com/purescript-node/purescript-node-path.git";
    src.git.rev = "d5f08cfde829b831408c4c6587cec83f2cd6a58e";
    
      
      
    info =
      { version = "5.0.0";
        dependencies =
          [ effect 
          ];
      };
  };
node-url =
  { 
    src.git.repo = "https://github.com/purescript-node/purescript-node-url.git";
    src.git.rev = "de7b279df13a9eeef2455af561525f37568c190e";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ nullable 
          ];
      };
  };
nonempty =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-nonempty";
    info =
      { 
        dependencies =
          [ control foldable-traversable maybe prelude tuples unfoldable 
          ];
      };
  };
nullable =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-nullable.git";
    src.git.rev = "3202744c6c65e8d1fbba7f4256a1c482078e7fb5";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ effect functions maybe 
          ];
      };
  };
numbers =
  { 
    src.git.repo = "https://github.com/purescript/purescript-numbers.git";
    src.git.rev = "27d54effdd2c0e7a86fe356b1cd813dca5981c2d";
    
      
      
    info =
      { version = "9.0.1";
        dependencies =
          [ functions maybe 
          ];
      };
  };
orders =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-orders";
    info =
      { 
        dependencies =
          [ newtype prelude 
          ];
      };
  };
partial =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-partial";
    info =
      { 
        dependencies =
          [ 
          ];
      };
  };
point-free =
  { 
    src.git.repo = "https://github.com/ursi/purescript-point-free.git";
    src.git.rev = "e4291b1c982312c9dd13e33fdd428817d08548cd";
    
      
      
    info =
      { version = "1.0.0";
        dependencies =
          [ prelude 
          ];
      };
  };
polymorphic-vectors =
  { 
    src.git.repo = "https://github.com/artemisSystem/purescript-polymorphic-vectors.git";
    src.git.rev = "a1abc4a911f242b0236c988f8a120cdfe6585522";
    
      
      
    info =
      { version = "4.0.0";
        dependencies =
          [ distributive foldable-traversable numbers prelude record safe-coerce type-equality typelevel-prelude 
          ];
      };
  };
posix-types =
  { 
    src.git.repo = "https://github.com/purescript-node/purescript-posix-types.git";
    src.git.rev = "b79ff37f87846ca5caab2123cf84148e700d40d1";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ maybe prelude 
          ];
      };
  };
prelude =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-prelude";
    info =
      { 
        dependencies =
          [ 
          ];
      };
  };
profunctor =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-profunctor";
    info =
      { 
        dependencies =
          [ control distributive either exists invariant newtype prelude tuples 
          ];
      };
  };
random =
  { 
    src.git.repo = "https://github.com/purescript/purescript-random.git";
    src.git.rev = "9540bc965a9596da02fefd9949418bb19c92533a";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ effect integers 
          ];
      };
  };
rationals =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-rationals.git";
    src.git.rev = "b480bc41dbfc926977ebdf4e2a4b9fed253c91a1";
    
      
      
    info =
      { version = "5.0.1";
        dependencies =
          [ integers prelude 
          ];
      };
  };
record =
  { 
    src.git.repo = "https://github.com/purescript/purescript-record.git";
    src.git.rev = "c89cd1ada6b636692571fc374196b1c39c4c9f70";
    
      
      
    info =
      { version = "4.0.0";
        dependencies =
          [ functions prelude unsafe-coerce 
          ];
      };
  };
refs =
  { 
    src.git.repo = "https://github.com/purescript/purescript-refs.git";
    src.git.rev = "f8e6216da4cb9309fde1f20cd6f69ac3a3b7f9e8";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ effect prelude 
          ];
      };
  };
result =
  { 
    src.git.repo = "https://github.com/ad-si/purescript-result.git";
    src.git.rev = "11bf97ec2872a7a4b4eae0a27b5c8c9cb8263a85";
    
      
      
    info =
      { version = "1.0.3";
        dependencies =
          [ either foldable-traversable prelude 
          ];
      };
  };
return =
  { 
    src.git.repo = "https://github.com/ursi/purescript-return.git";
    src.git.rev = "de6a6931507b82efd0180f9b945945ef202bc78a";
    
      
      
    info =
      { version = "0.2.0";
        dependencies =
          [ foldable-traversable point-free prelude 
          ];
      };
  };
ring-modules =
  { 
    src.git.repo = "https://github.com/f-o-a-m/purescript-ring-modules.git";
    src.git.rev = "48f72122e7f80dfd1efcc2bd5bb2f8fb92942f68";
    
      
      
    info =
      { version = "5.0.1";
        dependencies =
          [ prelude 
          ];
      };
  };
safe-coerce =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-safe-coerce";
    info =
      { 
        dependencies =
          [ unsafe-coerce 
          ];
      };
  };
st =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-st";
    info =
      { 
        dependencies =
          [ prelude 
          ];
      };
  };
strictlypositiveint =
  { 
    src.git.repo = "https://github.com/jamieyung/purescript-strictlypositiveint.git";
    src.git.rev = "feb38c7d0d8c50eeda4c263daf40817b9f9e374d";
    
      
      
    info =
      { version = "1.0.1";
        dependencies =
          [ prelude 
          ];
      };
  };
tagged =
  { 
    src.git.repo = "https://github.com/LiamGoodacre/purescript-tagged.git";
    src.git.rev = "55bdea636580c981634f5c4c559b9cfe68c55dea";
    
      
      
    info =
      { version = "4.0.2";
        dependencies =
          [ control foldable-traversable identity invariant newtype prelude profunctor 
          ];
      };
  };
tuples =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-tuples";
    info =
      { 
        dependencies =
          [ control invariant prelude 
          ];
      };
  };
type-equality =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-type-equality";
    info =
      { 
        dependencies =
          [ 
          ];
      };
  };
typelevel =
  { 
    src.git.repo = "https://github.com/bodil/purescript-typelevel.git";
    src.git.rev = "52975848003e42eb4cfb87895ff947e30b565ca9";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ partial prelude tuples typelevel-prelude unsafe-coerce 
          ];
      };
  };
typelevel-prelude =
  { 
    src.git.repo = "https://github.com/purescript/purescript-typelevel-prelude.git";
    src.git.rev = "dca2fe3c8cfd5527d4fe70c4bedfda30148405bf";
    
      
      
    info =
      { version = "7.0.0";
        dependencies =
          [ prelude type-equality 
          ];
      };
  };
typelevel-rows =
  { 
    src.git.repo = "https://github.com/jordanmartinez/purescript-typelevel-rows.git";
    src.git.rev = "2277c6ba93ed11a12af492ec0bdd90f75f042eec";
    
      
      
    info =
      { version = "0.1.0";
        dependencies =
          [ prelude 
          ];
      };
  };
undefined =
  { 
    src.git.repo = "https://github.com/bklaric/purescript-undefined.git";
    src.git.rev = "1cbf5599b8e71defead7fe7dcc90cd91dde8b3a3";
    
      
      
    info =
      { version = "2.0.0";
        dependencies =
          [ 
          ];
      };
  };
unfoldable =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-unfoldable";
    info =
      { 
        dependencies =
          [ foldable-traversable maybe partial prelude tuples 
          ];
      };
  };
unique =
  { 
    src.git.repo = "https://github.com/rowtype-yoga/purescript-unique.git";
    src.git.rev = "b250bc858e6b07dd5de5fc80701b80fc1503d1c4";
    
      
      
    info =
      { version = "0.6.0";
        dependencies =
          [ effect prelude refs 
          ];
      };
  };
unsafe-coerce =
  { 
    
    
    src.path = fetchGitSubdir
      { url = "https://github.com/purenix-org/purenix-base.git"; rev = "856f243d0aa214ee0a0f90e4be6045b6fee95bca"; allRefs = true; }
      "purescript-unsafe-coerce";
    info =
      { 
        dependencies =
          [ 
          ];
      };
  };
unsafe-reference =
  { 
    src.git.repo = "https://github.com/purescript-contrib/purescript-unsafe-reference.git";
    src.git.rev = "058e23b8b9adcf776a910f9934ff515ddee73af5";
    
      
      
    info =
      { version = "5.0.0";
        dependencies =
          [ prelude 
          ];
      };
  };
validation =
  { 
    src.git.repo = "https://github.com/purescript/purescript-validation.git";
    src.git.rev = "a3d9ec2176a7a808d70a01fa7e6f16d10e05429a";
    
      
      
    info =
      { version = "6.0.0";
        dependencies =
          [ bifunctors control either foldable-traversable newtype prelude 
          ];
      };
  };
web-geometry =
  { 
    src.git.repo = "https://github.com/purescript-web/purescript-web-geometry.git";
    src.git.rev = "54991647c5a8108c65f52e749c5ecc31ef69f6db";
    
      
      
    info =
      { version = "0.1.0";
        dependencies =
          [ 
          ];
      };
  };
web-proletarian =
  { 
    src.git.repo = "https://github.com/rowtype-yoga/purescript-web-proletarian.git";
    src.git.rev = "7ee734d8d907160691ba8e9c2adc3c1cb9b3c5be";
    
      
      
    info =
      { version = "1.0.0";
        dependencies =
          [ effect prelude 
          ];
      };
  };
 }
