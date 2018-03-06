// -*- coding: utf-8 -*-
// Copyright (C) 2011-2018 Laboratoire de Recherche et Développement
// de l'Epita (LRDE).
// Copyright (C) 2003, 2004, 2006 Laboratoire d'Informatique de Paris
// 6 (LIP6), département Systèmes Répartis Coopératifs (SRC),
// Université Pierre et Marie Curie.
//
// This file is part of Spot, a model checking library.
//
// Spot is free software; you can redistribute it and/or modify it
// under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3 of the License, or
// (at your option) any later version.
//
// Spot is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
// or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
// License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#include <spot/match_word.hh>

namespace spot
{
  std::vector<std::set<formula>> get_vector_formula(twa_word_ptr w,
      bool is_prefix)
  {
    std::vector<std::set<formula>> res;
    std::list<bdd> l = is_prefix ? w->prefix : w->cycle;
    for (auto x = l.begin(); x != l.end(); ++x)
      {
        res.push_back(bdd_to_formula(*x, w->get_dict()));
      }
    return res;
  }

  void rec_match(std::vector<std::set<formula>>& prefix,
      std::vector<std::set<formula>>& cycle, formula f)
  {
    if (f.is_leaf())
      return;
    if ()
  }

  bool match_word(formula f, twa_word_ptr w)
  {
    std::vector<std::set<formula>> prefix = get_vector_formula(w, true);
    std::vector<std::set<formula>> cycle = get_vector_formula(w, false);
    
  }
}
