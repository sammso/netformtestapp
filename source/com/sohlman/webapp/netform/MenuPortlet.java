/*
NetForm Library
---------------
Copyright (C) 2001-2004 - Sampsa Sohlman, Teemu Sohlman

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA 
*/
package com.sohlman.webapp.netform;

import com.sohlman.netform.Form;
import com.sohlman.netform.Portlet;

/**
 * This has been created for testing NetForm Portlet system.
 * 
 * @author Sampsa Sohlman
 */
public class MenuPortlet extends Portlet
{
	private boolean ib_isLoggedIn = false;
	
	public boolean isLoggedIn()
	{
		return getFormManager().isLoggedIn();
	}

	/**
	 * @param a_Form
	 */
	public MenuPortlet(Form a_Form)
	{
		super(a_Form);
		System.out.println("constructor MenuPortlet(Form a_Form)");
	}
	/**
	 * @see com.sohlman.netform.Portlet#init()
	 */
	public void init()
	{
		// TODO Auto-generated method stub
		System.out.println("MenuPortlet.init()");
	}

	/**
	 * @see com.sohlman.netform.Portlet#startService()
	 */
	public void startService()
	{
		// TODO Auto-generated method stub
		System.out.println("MenuPortlet.startService()");

	}

	/**
	 * @see com.sohlman.netform.Portlet#endService()
	 */
	public void endService()
	{
		// TODO Auto-generated method stub
		System.out.println("MenuPortlet.endService()");

	}

}
