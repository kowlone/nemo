package com.novacroft.nemo.mock_single_sign_on.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.novacroft.nemo.common.application_service.CountrySelectListService;
import com.novacroft.nemo.common.application_service.SelectListService;
import com.novacroft.nemo.common.transfer.SelectListDTO;
import com.novacroft.nemo.common.transfer.SelectListOptionDTO;
import com.novacroft.nemo.mock_single_sign_on.command.UserDetailsCmd;
import com.novacroft.nemo.mock_single_sign_on.constant.Page;
import com.novacroft.nemo.mock_single_sign_on.converter.UserConverter;
import com.novacroft.nemo.mock_single_sign_on.data_service.MasterCustomerDataService;
import com.novacroft.nemo.mock_single_sign_on.domain.User;
import com.novacroft.nemo.mock_single_sign_on.service.LogonService;
import com.novacroft.nemo.tfl.common.constant.PageAttribute;
import com.novacroft.nemo.tfl.common.constant.PageSelectList;
import com.novacroft.nemo.tfl.common.controller.BaseController;

@Controller
@RequestMapping(value = Page.UPDATE)
public class UpdatePersonalDetailsController extends BaseController {

    private static final String USER_DETAILS_CMD = "UserDetailsCmd";
    private static final String UPDATE_VIEW = "UpdateView";
    protected Map<String, String> applicationIdMap;

    @Autowired
    protected LogonService logonService;
    @Autowired
    protected SelectListService selectListService;
    @Autowired
    protected CountrySelectListService countrySelectListService;
    @Autowired
    protected UserConverter converter;
    @Autowired
    protected MasterCustomerDataService masterCustomerDataService;

    @Value("${apps}")
    private String appIdMap;

    @ModelAttribute
    public void populateModelAttributes(Model model) {
        applicationIdMap = new HashMap<String, String>(logonService.convert(appIdMap));
        SelectListDTO list = new SelectListDTO();
        for (Map.Entry<String, String> entry : applicationIdMap.entrySet()) {
            SelectListOptionDTO option = new SelectListOptionDTO();
            option.setValue(entry.getKey());
            option.setMeaning(entry.getValue());
            list.getOptions().add(option);
        }

        list.setName("appList");
        model.addAttribute("appList", list);
        model.addAttribute(PageAttribute.COUNTRIES, countrySelectListService.getSelectList());
        model.addAttribute(PageAttribute.TITLES, selectListService.getSelectList(PageSelectList.TITLES));
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView showUpdatePersonalDetails(@ModelAttribute(USER_DETAILS_CMD) UserDetailsCmd cmd, @RequestParam("id") Long customerId) {
        User user = masterCustomerDataService.findMasterCustomerById(customerId);
        cmd = converter.convert(user);
        cmd.setPassword(masterCustomerDataService.getPassword(customerId));
        return new ModelAndView(UPDATE_VIEW, USER_DETAILS_CMD, cmd);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView update(HttpServletResponse response, @ModelAttribute(USER_DETAILS_CMD) UserDetailsCmd cmd, BindingResult result) {
        if (StringUtils.isBlank(cmd.getPassword())) {
            cmd.setStatus("Please enter a password");
        } else {
            if (masterCustomerDataService.updateMasterCustomer(converter.convert(cmd))) {
                masterCustomerDataService.updatePassword(cmd.getCustomerId(), cmd.getPassword());
                cmd.setStatus("User " + cmd.getCustomerId() + " updated");
            }
            else {
                cmd.setStatus("Fail to update user detail.");
            }
        }

        return new ModelAndView(UPDATE_VIEW, USER_DETAILS_CMD, cmd);
    }
}
