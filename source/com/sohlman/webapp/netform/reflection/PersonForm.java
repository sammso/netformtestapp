package com.sohlman.webapp.netform.reflection;

import com.sohlman.netform.component.Button;
import com.sohlman.netform.component.ReflectionData;
import com.sohlman.netform.component.ReflectionValidate;
import com.sohlman.netform.component.TextField;
import com.sohlman.netform.component.table.AddRowButton;
import com.sohlman.netform.component.table.DeleteRowButton;
import com.sohlman.netform.component.table.InsertRowButton;
import com.sohlman.netform.component.table.ObjectCollectionTableModel;
import com.sohlman.netform.component.table.Table;
import com.sohlman.webapp.netform.MasterForm;

/**
 * @author Sampsa Sohlman
 */
public class PersonForm extends MasterForm
{
	public TextField firstNameTextField = new TextField(this,true,true,true);
	public TextField lastNameTextField = new TextField(this,true,true,true);
	public Table propertiesTable = new Table(this);
	public Button addButton = new AddRowButton(this, propertiesTable, 10);
	public Button insertButton = new InsertRowButton(this, propertiesTable, 10);
	public Button removeButton = new DeleteRowButton(this, propertiesTable, 0);
	
	public PersonForm()
	{
		TextField l_TextField = new TextField(propertiesTable, false, true, true, true);
		l_TextField.setComponentValidator(new ReflectionValidate());
		propertiesTable.setTableModelComponent(l_TextField, 1);
		l_TextField = new TextField(propertiesTable, false, true, true, true);
		l_TextField.setComponentValidator(new ReflectionValidate());
		propertiesTable.setTableModelComponent(l_TextField, 2);
	}
	
	/**
	 * @see com.sohlman.netform.Form#init()
	 */
	public void init()
	{
		super.init();
		//
		// Get Handle to Person
		//
		Person l_Person = getPerson();
		//
		// Components to Person fields
		//
		firstNameTextField.setComponentData(new ReflectionData(l_Person, "getFirstName", "setFirstName"));
		firstNameTextField.setComponentValidator(new ReflectionValidate());
		
		lastNameTextField.setComponentData(new ReflectionData(l_Person, "getLastName", "setLastName"));
		lastNameTextField.setComponentValidator(new ReflectionValidate());
		
		ObjectCollectionTableModel l_ObjectCollectionTableModel = new ObjectCollectionTableModel();
		l_ObjectCollectionTableModel.setCollection(l_Person.getPersonProperties());
		l_ObjectCollectionTableModel.setColummnCount(2);
		l_ObjectCollectionTableModel.setCollectoinItemClass(PersonProperty.class);
		l_ObjectCollectionTableModel.setParentObjectForCollectionItem(l_Person);
		l_ObjectCollectionTableModel.assignSetParentMethodForItem("setPerson");
		l_ObjectCollectionTableModel.assignCollectionColumn("Name",1);
		l_ObjectCollectionTableModel.assignCollectionColumn("Value",2);
		propertiesTable.setTableModel(l_ObjectCollectionTableModel);
		propertiesTable.setMultiSelection(true);
	}
	
	public Person getPerson()
	{
		Person l_Person = (Person)getHttpSession().getAttribute(this.getClass().getName());
		if(l_Person == null)
		{
			l_Person = new Person();
			l_Person.addPersonProperty();
			getHttpSession().setAttribute(this.getClass().getName(), l_Person);
		}		
		return l_Person;
	}
	
	
	/**
	 * @return Returns the firstNameTextField.
	 */
	public TextField getFirstNameTextField()
	{
		return firstNameTextField;
	}
	/**
	 * @return Returns the insertButton.
	 */
	public Button getInsertButton()
	{
		return insertButton;
	}
	/**
	 * @return Returns the lastNameTextField.
	 */
	public TextField getLastNameTextField()
	{
		return lastNameTextField;
	}
	/**
	 * @return Returns the propertiesTable.
	 */
	public Table getPropertiesTable()
	{
		return propertiesTable;
	}
	/**
	 * @return Returns the removeButton.
	 */
	public Button getRemoveButton()
	{
		return removeButton;
	}
}
